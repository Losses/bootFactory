import 'package:provider/provider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

import './_store/editor_context.dart';
import '../../../components/settings_menu_button.dart';

class EditorIndex extends StatelessWidget {
  const EditorIndex({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final editor = context.read<EditorContext>();

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SettingsMenuTitle(title: 'Project'),
            SettingsMenuButton(
              leading: const Icon(
                FluentIcons.size_legacy,
                size: 20,
              ),
              title: 'Package',
              description: 'Canvas size and package metadata',
              onPressed: () {
                context.push('/edit/${editor.getId()}/package_editor');
              },
            ),
            const SettingsMenuTitle(title: 'Design'),
            SettingsMenuButton(
              leading: const Icon(
                FluentIcons.d365_project_operations,
                size: 20,
              ),
              title: 'Entering Animation',
              description: 'The animation while the boot screen shows up',
              onPressed: () {
                context.push('/edit/${editor.getId()}/layer_editor');
              },
            ),
            const SizedBox(height: 8),
            SettingsMenuButton(
              leading: const Icon(
                FluentIcons.progress_loop_outer,
                size: 20,
              ),
              title: 'Loop Animation',
              description: 'The looping part of the animation',
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            SettingsMenuButton(
              leading: const Icon(
                FluentIcons.flag,
                size: 20,
              ),
              title: 'Exit Animation',
              description:
                  'The animation to be shown while system finished initialization',
              onPressed: () {},
            ),
            const SettingsMenuTitle(title: 'Output'),
            SettingsMenuButton(
              leading: const Icon(
                FluentIcons.build,
                size: 20,
              ),
              title: 'Compile',
              description: 'Compile your project to a Magisk module',
              onPressed: () {},
            ),
          ],
        ),
    );
  }
}

class SettingsMenuTitle extends StatelessWidget {
  const SettingsMenuTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
