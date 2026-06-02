class Task {
  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.dueDate,
  });

  final String id;
  String title;
  String description;
  String status;
  String dueDate;

  static const String statusPendente = 'Pendente';
  static const String statusConcluida = 'Concluída';

  static const List<String> statusOptions = [
    statusPendente,
    statusConcluida,
  ];

  Task copyWith({
    String? title,
    String? description,
    String? status,
    String? dueDate,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      dueDate: dueDate ?? this.dueDate,
    );
  }
}
