import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class _ColorPicker extends StatefulWidget {
  late Color _color;
  final Function(Color color) onColorChange;

  _ColorPicker({
    required Color initialColor,
    required this.onColorChange,
  }) {
    _color = initialColor;
  }

  @override
  createState() => _ColorPickerState();
}

class _ColorPickerState extends State<_ColorPicker> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HueRingPicker(
      enableAlpha: true,
      pickerColor: widget._color,
      onColorChanged: (Color color) {
        setState(() {
          widget._color = color;
        });
      },
    );
  }
}

Future<Color?> showColorPickerDialog(
    Color initialColor, BuildContext context) async {
  Color color = initialColor;

  return showDialog<Color?>(
    context: context,
    builder: (context) => ContentDialog(
      constraints: const BoxConstraints(
        maxWidth: 488.0,
        maxHeight: 464.0,
      ),
      title: const Text('Pick a Color'),
      content: _ColorPicker(
        initialColor: initialColor,
        onColorChange: (x) {
          color = x;
        },
      ),
      actions: [
        FilledButton(
          child: const Text('Confirm'),
          onPressed: () => Navigator.pop(context, color),
        ),
        Button(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context, null),
        ),
      ],
    ),
  );
}
