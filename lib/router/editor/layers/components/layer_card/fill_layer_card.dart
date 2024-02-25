import 'package:fluent_ui/fluent_ui.dart';

import './layer_card_base.dart';
import '../utils/color_picker_modal.dart';
import '../../constants/layer_config.dart';

class FillLayerCard extends StatelessWidget {
  const FillLayerCard({
    super.key,
    required this.index,
    required this.config,
    required this.onChanged,
    required this.onAdd,
    required this.onExpand,
  });

  final int index;
  final LayerConfig config;
  final Function() onChanged;
  final Function(int index) onAdd;
  final Function() onExpand;

  @override
  Widget build(BuildContext context) {
    return LayerCardBase(
      index: index,
      config: config,
      onChanged: onChanged,
      onAdd: onAdd,
      onExpand: onExpand,
      child: Button(
        child: const Row(
          children: [
            Icon(FluentIcons.color),
            SizedBox(
              width: 8,
            ),
            Text('Pick Color')
          ],
        ),
        onPressed: () async {
          if (config is LayerConfig<Color?>) {
            final color = await showColorPickerDialog(
              config.detail ?? const Color.fromARGB(255, 255, 255, 255),
              context,
            );
            if (color != null) {
              config.detail = color;
              onChanged();
            }
          }
        },
      ),
    );
  }
}
