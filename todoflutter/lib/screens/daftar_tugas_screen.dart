import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/tugas.dart';
import '../services/api_service.dart';
import 'tugas_form_screen.dart';
import 'profile_screen.dart';
import 'login_screen.dart';

class DaftarTugasScreen extends StatefulWidget {
  const DaftarTugasScreen({super.key});

  @override
  State<DaftarTugasScreen> createState() => _DaftarTugasScreenState();
}

class _DaftarTugasScreenState extends State<DaftarTugasScreen> {
  List<Tugas> tugasList = [];
  String userName = 'friend';
  final api = ApiService();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await api.loadTokenFromPrefs();
    _loadUserName();
    _fetchTasksFromServer();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('name') ?? 'friend';
    });
  }

  Future<void> _fetchTasksFromServer() async {
    try {
      await api.loadTokenFromPrefs();
      final tasks = await api.fetchTask();
      setState(() {
        tugasList = tasks;
        _urutkanTugas();
      });
    } catch (e) {
      _redirectToLogin('Sesi login berakhir, silakan login kembali.');
    }
  }

  void _redirectToLogin(String message) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    }
  }

  Future<void> _tambahTugas() async {
    final result = await Navigator.push<Map<String, dynamic>?>(
      context,
      MaterialPageRoute(builder: (_) => const TugasFormScreen()),
    );

    if (result == null ||
        result['tugas'] == null ||
        result['dueDate'] == null ||
        result['priority'] == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data tugas tidak lengkap')),
      );
      return;
    }

    final parsedDueDate = DateTime.tryParse(result['dueDate'].toString());
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('user_id');

    if (userId == null || parsedDueDate == null) {
      _redirectToLogin('User ID atau tanggal tidak valid.');
      return;
    }

    final newTask = Tugas(
      id: 0,
      userId: userId,
      title: result['tugas'],
      description: '',
      isDone: false,
      dueDate: parsedDueDate,
      priority: result['priority'],
    );

    try {
      final saved = await api.addTask(newTask);
      setState(() {
        tugasList.add(saved);
        _urutkanTugas();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menambahkan tugas: $e')),
      );
    }
  }

  Future<void> _editTugas(int index) async {
    final tugas = tugasList[index];
    final result = await Navigator.push<Map<String, dynamic>?>(
      context,
      MaterialPageRoute(
        builder: (_) => TugasFormScreen(
          tugas: tugas.title,
          index: index,
          existingDueDate: tugas.dueDate,
          priority: tugas.priority,
        ),
      ),
    );

    if (result == null ||
        result['tugas'] == null ||
        result['dueDate'] == null ||
        result['priority'] == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data edit tidak lengkap')),
      );
      return;
    }

    final parsedDueDate = DateTime.tryParse(result['dueDate'].toString());
    if (parsedDueDate == null) return;

    final updated = Tugas(
      id: tugas.id,
      userId: tugas.userId,
      title: result['tugas'],
      description: tugas.description,
      isDone: tugas.isDone,
      dueDate: parsedDueDate,
      priority: result['priority'],
    );

    try {
      await api.updateTask(updated);
      setState(() {
        tugasList[index] = updated;
        _urutkanTugas();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memperbarui tugas: $e')),
      );
    }
  }

  Future<void> _hapusTugas(int index) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Konfirmasi"),
        content: const Text("Yakin ingin menghapus tugas ini?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Tidak")),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text("Ya")),
        ],
      ),
    );
    if (confirm == true) {
      try {
        await api.deleteTask(tugasList[index].id);
        setState(() {
          tugasList.removeAt(index);
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menghapus tugas: $e')),
        );
      }
    }
  }

  void _toggleSelesai(int index) async {
    final tugas = tugasList[index];
    final updated = Tugas(
      id: tugas.id,
      userId: tugas.userId,
      title: tugas.title,
      description: tugas.description,
      isDone: !tugas.isDone,
      dueDate: tugas.dueDate,
      priority: tugas.priority,
    );

    try {
      await api.updateTask(updated);
      setState(() {
        tugasList[index] = updated;
        _urutkanTugas();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal update status tugas: $e')),
      );
    }
  }

  void _urutkanTugas() {
    tugasList.sort((a, b) {
      if (a.isDone != b.isDone) return a.isDone ? 1 : -1;
      return a.dueDate.compareTo(b.dueDate);
    });
  }

  Color getPriorityColor(String priority) {
    switch (priority) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

  int getPriorityLevel(String priority) {
    switch (priority) {
      case 'high':
        return 3;
      case 'medium':
        return 2;
      default:
        return 1;
    }
  }

  Future<void> _logout() async {
    try {
      await api.logoutFromServer();
    } catch (_) {}
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Tugas'), backgroundColor: Colors.teal),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.teal),
              child: Column(
                children: [
                  SizedBox(width: 80, height: 80, child: Image.asset('assets/images/1.png')),
                  const SizedBox(height: 8),
                  Text('Hai, $userName', style: const TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.teal),
              title: const Text('Profile'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen())),
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: tugasList.length,
        itemBuilder: (context, index) {
          final task = tugasList[index];
          final isExpired = task.dueDate.isBefore(DateTime.now());

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: ListTile(
                onTap: () => _editTugas(index),
                contentPadding: const EdgeInsets.all(16),
                title: Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: task.isDone ? TextDecoration.lineThrough : null,
                    color: task.isDone ? Colors.grey : Colors.black,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deadline: ${DateFormat('dd MMM yyyy – HH:mm').format(task.dueDate)}',
                      style: TextStyle(
                        color: isExpired ? Colors.red : Colors.black87,
                        fontStyle: isExpired ? FontStyle.italic : null,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: List.generate(3, (i) => Icon(
                        Icons.star,
                        size: 18,
                        color: i < getPriorityLevel(task.priority)
                            ? getPriorityColor(task.priority)
                            : Colors.grey.shade300,
                      )),
                    )
                  ],
                ),
                leading: IconButton(
                  icon: Icon(
                    task.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: task.isDone ? Colors.green : Colors.grey,
                  ),
                  onPressed: isExpired ? null : () => _toggleSelesai(index),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _hapusTugas(index),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tambahTugas,
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
