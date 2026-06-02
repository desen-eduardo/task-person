import 'package:flutter_test/flutter_test.dart';
import 'package:task_person/main.dart';

void main() {
  testWidgets('TaskPerson exibe título no AppBar', (tester) async {
    await tester.pumpWidget(const TaskPersonApp());
    expect(find.text('TaskPerson'), findsOneWidget);
    expect(find.text('Mercado'), findsOneWidget);
  });
}
