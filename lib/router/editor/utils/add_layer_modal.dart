import 'package:fluent_ui/fluent_ui.dart';

import '../constants/layer_config.dart';
import '../components/new_layer_button.dart';

Future<LayerTypeId?> showAddLayerDialog(bool hasAnimation, BuildContext context) async {
  Typography typography = FluentTheme.of(context).typography;

  return showDialog<LayerTypeId>(
    context: context,
    builder: (context) => ContentDialog(
      constraints: const BoxConstraints(
        maxWidth: 488.0,
        maxHeight: 464.0,
      ),
      title: const Text('Select Layer Type'),
      content: Column(
        children: [
          const Text(
            'Select the layer you would like to add, these layers will be stacked and be rendered.',
          ),
          const SizedBox(height: 24),
          NewLayerButton(
            disabled: hasAnimation,
            layerType: layerTypes[LayerTypeId.animation]!,
            typography: typography,
          ),
          const SizedBox(height: 16),
          NewLayerButton(
            layerType: layerTypes[LayerTypeId.picture]!,
            typography: typography,
          ),
          const SizedBox(height: 16),
          NewLayerButton(
            layerType: layerTypes[LayerTypeId.fill]!,
            typography: typography,
          ),
        ],
      ),
      actions: [
        Button(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context, null),
        ),
      ],
    ),
  );
}
