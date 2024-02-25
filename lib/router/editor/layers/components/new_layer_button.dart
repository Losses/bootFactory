import 'package:fluent_ui/fluent_ui.dart';

import '../constants/layer_config.dart';
import '../../../../components/settings_menu_button.dart';

class NewLayerButton extends StatelessWidget {
  const NewLayerButton({
    super.key,
    required this.layerType,
    this.disabled = false,
  });

  final bool disabled;
  final LayerType layerType;

  @override
  Widget build(BuildContext context) {
    final leading = Icon(
      layerType.icon,
      size: 24,
    );

    final title = layerType.label;
    final description = layerType.description;
    final onPressed =
        disabled ? null : () => Navigator.pop(context, layerType.id);

    return SettingsMenuButton(
      onPressed: onPressed,
      leading: leading,
      title: title,
      description: description,
    );
  }
}
