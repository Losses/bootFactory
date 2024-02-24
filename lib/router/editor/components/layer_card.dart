import 'package:fluent_ui/fluent_ui.dart';

import './config_slide.dart';
import '../constants/layer_config.dart';

class LayerCard extends StatelessWidget {
  const LayerCard({
    super.key,
    required this.config,
    required this.onChanged,
    required this.onAdd,
    required this.onExpand,
  });

  final LayerConfig config;
  final Function() onChanged;
  final Function() onAdd;
  final Function() onExpand;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expander(
          leading: layerTypes[config.type]!.icon,
          header: Text(layerTypes[config.type]!.label),
          initiallyExpanded: config.open,
          onStateChanged: (state) {
            config.open = state;
          },
          content: Column(
            children: [
              ConfigSlide(
                label: 'Width',
                value: config.W,
                onChanged: (v) {
                  config.W = v;
                  onChanged();
                },
              ),
              ConfigSlide(
                label: 'Height',
                value: config.H,
                onChanged: (v) {
                  config.H = v;
                  onChanged();
                },
              ),
              ConfigSlide(
                label: 'X',
                value: config.X,
                onChanged: (v) {
                  config.X = v;
                  onChanged();
                },
              ),
              ConfigSlide(
                label: 'Y',
                value: config.Y,
                onChanged: (v) {
                  config.Y = v;
                  onChanged();
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(FluentIcons.add),
            onPressed: onAdd,
          ),
        )
      ],
    );
  }
}
