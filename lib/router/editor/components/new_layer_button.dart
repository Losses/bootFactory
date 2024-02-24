import 'package:fluent_ui/fluent_ui.dart';

import '../constants/layer_config.dart';

class NewLayerButton extends StatelessWidget {
  const NewLayerButton({
    super.key,
    required this.layerType,
    required this.typography,
  });

  final LayerType layerType;
  final Typography typography;

  @override
  Widget build(BuildContext context) {
    return Button(
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
                  style: typography.subtitle,
                ),
                Text(
                  layerType.description,
                ),
              ],
            )
          ],
        ),
      ),
      onPressed: () => Navigator.pop(context, LayerTypeId.animation),
    );
  }
}
