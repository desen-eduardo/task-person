# TaskPerson

Aplicativo Flutter de gerenciamento de tarefas com dados em memória (lista de objetos).

## Funcionalidades

- Listagem de tarefas com título, descrição, status e data de vencimento
- Cadastro de nova tarefa (FAB +)
- Edição (ícone lápis azul)
- Exclusão (ícone lixeira vermelha)
- Status: **Pendente** ou **Concluída**

## Executar

```bash
flutter pub get
flutter run
```

## Estrutura

```
lib/
  main.dart                 # Entrada do app
  models/task.dart          # Modelo da tarefa
  theme/app_theme.dart      # Cores e tema (verde escuro)
  screens/
    home_screen.dart        # Listagem
    task_form_screen.dart   # Cadastro / edição
```

Os dados ficam em `List<Task> _tasks` na `HomeScreen`, sem banco de dados.
