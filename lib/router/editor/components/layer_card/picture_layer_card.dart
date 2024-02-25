import 'package:fluent_ui/fluent_ui.dart';
import 'package:file_picker/file_picker.dart';

import 'layer_card_base.dart';
import '../../constants/layer_config.dart';

class PictureLayerCard extends StatelessWidget {
  const PictureLayerCard({
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
            Icon(FluentIcons.open_folder_horizontal),
            SizedBox(
              width: 8,
            ),
            Text('Pick animation'),
          ],
        ),
        onPressed: () async {
          if (config is LayerConfig<String?>) {
            final result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['png', 'jpg', 'webp', 'svg'],
            );

            final path = result?.files[0].path;

            if (path != null) {
              config.detail = path;
              onChanged();
            }
          }
        },
      ),
    );
  }
}
