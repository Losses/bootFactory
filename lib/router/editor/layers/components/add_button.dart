import 'package:fluent_ui/fluent_ui.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.index,
    required this.onAdd,
  });

  final int index;
  final Function(int index) onAdd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: const Icon(FluentIcons.add),
        onPressed: () {
          onAdd(index);
        },
      ),
    );
  }
}
