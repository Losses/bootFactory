import 'package:fluent_ui/fluent_ui.dart';

import '../add_button.dart';
import '../config_slide.dart';
import '../../constants/layer_config.dart';

class LayerCardBase extends StatelessWidget {
  const LayerCardBase({
    super.key,
    required this.index,
    required this.config,
    required this.onChanged,
    required this.onAdd,
    required this.onExpand,
    this.child,
  });

  final int index;
  final LayerConfig config;
  final Function() onChanged;
  final Function(int index) onAdd;
  final Function() onExpand;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expander(
          leading: Icon(layerTypes[config.type]!.icon),
          header: Text(layerTypes[config.type]!.label),
          initiallyExpanded: config.open,
          onStateChanged: (state) {
            config.open = state;
          },
          content: Column(
            children: [
              child ?? Container(),
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
        AddButton(index: index, onAdd: onAdd)
      ],
    );
  }
}
