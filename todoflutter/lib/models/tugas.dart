class Tugas {
  final int id;
  final int userId;
  final String title;
  final String? description;
  final bool isDone;
  final DateTime dueDate;
  final String priority;

  Tugas({
    required this.id,
    required this.userId,
    required this.title,
    this.description,
    this.isDone = false,
    required this.dueDate,
    required this.priority,
  });

  factory Tugas.fromJson(Map<String, dynamic> json) {
  return Tugas(
    id: json['id'] ?? 0,
    userId: json['user_id'] ?? 0,
    title: json['title'] ?? 'Tanpa Judul',
    description: json['description'],
    isDone: json['is_done'] == 1 || json['is_done'] == true,
    dueDate: DateTime.tryParse(json['due_date'] ?? '') ?? DateTime.now(), // ✅ anti error parsing null
    priority: json['priority'] ?? 'low', // default kalau null
  );
}

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'description': description ?? '',
      'is_done': isDone ? 1 : 0, // ✅ Kirim kembali dalam bentuk int (agar cocok dengan backend Laravel-mu)
      'due_date': dueDate.toIso8601String(),
      'priority': priority,
    };
  }
}
