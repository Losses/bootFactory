import 'package:fluent_ui/fluent_ui.dart';

import '../../../../components/settings_menu_button.dart';

class EditorIndex extends StatelessWidget {
  const EditorIndex({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SettingsMenuButton(
        leading: const Icon(FluentIcons.size_legacy),
        title: 'Package',
        description: 'Canvas size and package metadata',
        onPressed: () {},
      ),
      SettingsMenuButton(
        leading: const Icon(FluentIcons.size_legacy),
        title: 'Entering Animation',
        description: 'The animation while the boot screen shows up',
        onPressed: () {},
      ),
      SettingsMenuButton(
        leading: const Icon(FluentIcons.progress_loop_outer),
        title: 'Loop Animation',
        description: 'The looping part of the animation',
        onPressed: () {},
      ),
      SettingsMenuButton(
        leading: const Icon(FluentIcons.flag),
        title: 'Exit Animation',
        description: 'The animation to be shown while system finished initialization',
        onPressed: () {},
      ),
      SettingsMenuButton(
        leading: const Icon(FluentIcons.build),
        title: 'Compile',
        description: 'Compile your project to a Magisk module',
        onPressed: () {},
      ),
    ]);
  }
}
