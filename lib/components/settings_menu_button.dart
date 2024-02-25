import 'package:fluent_ui/fluent_ui.dart';

class SettingsMenuButton extends StatelessWidget {
  const SettingsMenuButton({
    super.key,
    required this.onPressed,
    required this.leading,
    required this.title,
    required this.description,
  });

  final void Function()? onPressed;
  final Icon leading;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final typography = FluentTheme.of(context).typography;

    return Button(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          children: [
            leading,
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: typography.body?.color?.withAlpha(160),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
