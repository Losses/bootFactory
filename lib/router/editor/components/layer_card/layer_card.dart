import 'package:fluent_ui/fluent_ui.dart';

import './animation_layer_card.dart';
import './fill_layer_card.dart';
import './picture_layer_card.dart';
import '../../constants/layer_config.dart';

class LayerCard extends StatelessWidget {
  const LayerCard({
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
    print(config);
    if (config.type == LayerTypeId.fill && config is LayerConfig<Color?>) {
      return FillLayerCard(
        index: index,
        config: config,
        onChanged: onChanged,
        onAdd: onAdd,
        onExpand: onExpand,
      );
    }

    if (config.type == LayerTypeId.animation &&
        config is LayerConfig<String?>) {
      return AnimationLayerCard(
        index: index,
        config: config,
        onChanged: onChanged,
        onAdd: onAdd,
        onExpand: onExpand,
      );
    }

    if (config.type == LayerTypeId.picture && config is LayerConfig<String?>) {
      return PictureLayerCard(
          index: index,
          config: config,
          onChanged: onChanged,
          onAdd: onAdd,
          onExpand: onExpand);
    }

    return const Text('INVALID LAYER CARD');
  }
}
