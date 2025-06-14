import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/tugas.dart';

class ApiService {
  final String baseUrl = 'http://192.168.117.107:8000/api';
  String? token;

  Future<void> loadTokenFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('access_token');
  }

  // LOGIN
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      token = data['access_token'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', token!);
      await prefs.setInt('user_id', data['user']['id']);
      await prefs.setString('name', data['user']['name']);

      return data;
    } else {
      throw Exception('Login gagal: ${response.body}');
    }
  }

  // REGISTER
  Future<Map<String, dynamic>> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      token = data['access_token'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', token!);
      await prefs.setInt('user_id', data['user']['id']);
      await prefs.setString('name', data['user']['name']);

      return data;
    } else {
      throw Exception('Register gagal: ${response.body}');
    }
  }

  // FETCH TASKS
  Future<List<Tugas>> fetchTask() async {
    await loadTokenFromPrefs();
    _checkToken();

    final response = await http.get(
      Uri.parse('$baseUrl/tasks'),
      headers: _authHeaders(),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      List<dynamic> data;

      if (decoded is List) {
        data = decoded;
      } else if (decoded is Map<String, dynamic> && decoded.containsKey('data')) {
        data = decoded['data'];
      } else {
        throw Exception('Format data tidak dikenali: $decoded');
      }

      return data.map((item) => Tugas.fromJson(item)).toList();
    } else {
      throw Exception('Gagal memuat tugas (status: ${response.statusCode})');
    }
  }

  // ADD TASK
  Future<Tugas> addTask(Tugas task) async {
  await loadTokenFromPrefs();
  _checkToken();

  final response = await http.post(
    Uri.parse('$baseUrl/tasks'),
    headers: _authHeaders(),
    body: jsonEncode({
      'title': task.title,
      'description': task.description ?? '',
      'priority': task.priority,
      'due_date': task.dueDate.toIso8601String(),
      'user_id': task.userId,
    }),
  );

  if (response.statusCode == 201 || response.statusCode == 200) {
    final decoded = jsonDecode(response.body);

    // ✅ Langsung pakai decoded jika tidak ada 'data'
    if (decoded is Map<String, dynamic>) {
      return Tugas.fromJson(decoded);
    } else {
      throw Exception('Format respons tidak sesuai: ${response.body}');
    }
  } else {
    throw Exception('Gagal menyimpan tugas: ${response.statusCode} - ${response.body}');
  }
}

  // UPDATE TASK
  Future<void> updateTask(Tugas task) async {
    await loadTokenFromPrefs();
    _checkToken();

    final response = await http.put(
      Uri.parse('$baseUrl/tasks/${task.id}'),
      headers: _authHeaders(),
      body: jsonEncode({
        'title': task.title,
        'description': task.description ?? '',
        'priority': task.priority,
        'due_date': task.dueDate.toString(),
        'user_id': task.userId,
        'is_done': task.isDone,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal memperbarui tugas: ${response.body}');
    }
  }

  // DELETE TASK
  Future<void> deleteTask(int id) async {
    await loadTokenFromPrefs();
    _checkToken();

    final response = await http.delete(
      Uri.parse('$baseUrl/tasks/$id'),
      headers: _authHeaders(),
    );

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Gagal menghapus tugas: ${response.body}');
    }
  }

  // LOGOUT
  Future<void> logoutFromServer() async {
    if (token == null) return;

    final response = await http.post(
      Uri.parse('$baseUrl/logout'),
      headers: _authHeaders(),
    );

    token = null;

    if (response.statusCode != 200) {
      throw Exception('Logout gagal: ${response.body}');
    }
  }

  // HEADER
  Map<String, String> _authHeaders() => {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  // CEK TOKEN
  void _checkToken() {
    if (token == null || token!.isEmpty) {
      throw Exception("Token belum tersedia. Silakan login dulu.");
    }
  }
}
