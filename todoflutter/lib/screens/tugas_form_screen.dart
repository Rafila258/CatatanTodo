import 'package:flutter/material.dart';

class TugasFormScreen extends StatefulWidget {
  final String? tugas;
  final int? index;
  final DateTime? existingDueDate;
  final String? priority;

  const TugasFormScreen({
    super.key,
    this.tugas,
    this.index,
    this.existingDueDate,
    this.priority,
  });

  @override
  State<TugasFormScreen> createState() => _TugasFormScreenState();
}

class _TugasFormScreenState extends State<TugasFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tugasController = TextEditingController();
  DateTime? _selectedDateTime;
  String _selectedPriority = 'low';

  @override
  void initState() {
    super.initState();
    if (widget.tugas != null) {
      _tugasController.text = widget.tugas!;
      _selectedDateTime = widget.existingDueDate;
      _selectedPriority = widget.priority ?? 'low';
    }
  }

  Future<void> _pickDateTime() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );

    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime ?? now),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  void _simpanTugas() {
    if (_formKey.currentState!.validate()) {
      if (_selectedDateTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Silakan pilih tanggal dan waktu')),
        );
        return;
      }

      if (_selectedDateTime!.isBefore(DateTime.now())) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tanggal dan waktu harus di masa depan')),
        );
        return;
      }

      Navigator.pop(context, {
        'tugas': _tugasController.text,
        'index': widget.index,
        'dueDate':  _selectedDateTime, 
        'priority': _selectedPriority,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.tugas != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Tugas' : 'Tambah Tugas'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _tugasController,
                decoration: const InputDecoration(
                  labelText: 'Nama Tugas',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Tugas tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedPriority,
                decoration: const InputDecoration(
                  labelText: 'Prioritas',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'low', child: Text('Low')),
                  DropdownMenuItem(value: 'medium', child: Text('Medium')),
                  DropdownMenuItem(value: 'high', child: Text('High')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedPriority = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _pickDateTime,
                      icon: const Icon(Icons.calendar_today),
                      label: Text(
                        _selectedDateTime == null
                            ? 'Pilih Tanggal & Waktu'
                            : 'Dipilih:\n${_selectedDateTime!.toLocal()}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _simpanTugas,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        isEditing ? 'Simpan' : 'Tambah',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
