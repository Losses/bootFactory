import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import './_store/editor_context.dart';

class EditorShell extends StatelessWidget {
  final Widget child;

  const EditorShell({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: editorContext,
      child: Row(children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600,
          ),
          child: child,
        ),
        const Text("121"),
      ]),
    );
  }
}
