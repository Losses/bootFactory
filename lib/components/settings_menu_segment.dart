import 'package:fluent_ui/fluent_ui.dart';

class SettingsMenuSegment extends StatelessWidget {
  const SettingsMenuSegment({
    super.key,
    required this.title,
    required this.children,
    required this.leading,
  });

  final String title;
  final List<Widget> children;
  final Icon leading;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              leading,
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(fontSize: 14),
              ),
            ]),
            Row(children: children),
          ],
        ),
      ),
    );
  }
}
