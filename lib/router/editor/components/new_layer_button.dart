import 'package:fluent_ui/fluent_ui.dart';

import '../constants/layer_config.dart';

class NewLayerButton extends StatelessWidget {
  const NewLayerButton({
    super.key,
    required this.layerType,
    required this.typography,
    this.disabled = false,
  });

  final bool disabled;
  final LayerType layerType;
  final Typography typography;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed:
          disabled ? null : () => Navigator.pop(context, layerType.id),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          children: [
            Icon(
              layerType.icon,
              size: 32,
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  layerType.label,
                  // style: typography.subtitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
                Text(
                  layerType.description,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
