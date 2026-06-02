import 'package:flutter/material.dart';

import '../models/task.dart';
import '../theme/app_theme.dart';
import 'task_form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [
    Task(
      id: '1',
      title: 'Mercado',
      description: 'Fazer compras',
      status: Task.statusConcluida,
      dueDate: '2026-05-30',
    ),
    Task(
      id: '2',
      title: 'Academia',
      description: 'Ir na academia',
      status: Task.statusPendente,
      dueDate: '2026-06-01',
    ),
    Task(
      id: '3',
      title: 'Estudar',
      description: 'Trabalho da pós-graduação Flutter',
      status: Task.statusPendente,
      dueDate: '2026-06-01',
    ),
  ];

  Future<void> _openForm({Task? task}) async {
    final result = await Navigator.push<Task>(
      context,
      MaterialPageRoute(
        builder: (_) => TaskFormScreen(task: task),
      ),
    );

    if (result == null) return;

    setState(() {
      final index = _tasks.indexWhere((t) => t.id == result.id);
      if (index >= 0) {
        _tasks[index] = result;
      } else {
        _tasks.add(result);
      }
    });
  }

  void _deleteTask(Task task) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Excluir tarefa'),
        content: Text('Deseja excluir "${task.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() => _tasks.removeWhere((t) => t.id == task.id));
              Navigator.pop(ctx);
            },
            style: TextButton.styleFrom(foregroundColor: AppTheme.deleteRed),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightGray,
      appBar: AppBar(
        title: const Text('TaskPerson'),
      ),
      body: _tasks.isEmpty
          ? const Center(
              child: Text(
                'Nenhuma tarefa cadastrada',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 16),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _tasks.length,
              separatorBuilder: (_, __) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                return _TaskCard(
                  task: _tasks[index],
                  onEdit: () => _openForm(task: _tasks[index]),
                  onDelete: () => _deleteTask(_tasks[index]),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openForm(),
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  const _TaskCard({
    required this.task,
    required this.onEdit,
    required this.onDelete,
  });

  final Task task;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.fromLTRB(16, 14, 12, 10),
      decoration: BoxDecoration(
        color: AppTheme.cardWhite,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  task.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                task.dueDate,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            task.status,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: onEdit,
                style: IconButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  visualDensity: VisualDensity.compact,
                ),
                icon: const Icon(Icons.edit, color: AppTheme.editBlue, size: 22),
              ),
              IconButton(
                onPressed: onDelete,
                style: IconButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  visualDensity: VisualDensity.compact,
                ),
                icon: const Icon(Icons.delete, color: AppTheme.deleteRed, size: 22),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
