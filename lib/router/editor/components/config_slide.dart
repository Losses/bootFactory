import 'package:fluent_ui/fluent_ui.dart';

class ConfigSlide extends StatelessWidget {
  const ConfigSlide({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final double value;
  final Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(label),
          ),
          Slider(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
