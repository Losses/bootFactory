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
      onPressed: disabled ? null : () => Navigator.pop(context, layerType.id),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          children: [
            Icon(
              layerType.icon,
              size: 24,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  layerType.label,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  layerType.description,
                  style: TextStyle(
                    fontSize: 13,
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
