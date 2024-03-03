import 'package:fluent_ui/fluent_ui.dart';

import 'package:boot_factory/router/editor/editor_index.dart';
import 'package:boot_factory/components/settings_menu_segment.dart';

class PackageEditor extends StatelessWidget {
  const PackageEditor({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = FluentTheme.of(context).typography;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SettingsMenuTitle(title: 'Canvas'),
          SettingsMenuSegment(
            title: 'Screen Size',
            leading: const Icon(FluentIcons.scale_volume),
            children: [
              SizedBox(
                width: 58,
                child: NumberBox(
                  mode: SpinButtonPlacementMode.none,
                  value: 0,
                  clearButton: false,
                  onChanged: (x) {},
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('×'),
              ),
              SizedBox(
                width: 58,
                child: NumberBox(
                  mode: SpinButtonPlacementMode.none,
                  value: 0,
                  clearButton: false,
                  onChanged: (x) {},
                ),
              )
            ],
          ),
          const SettingsMenuTitle(title: 'Design'),
          SettingsMenuSegment(
            leading: const Icon(
              FluentIcons.d365_project_operations,
              size: 20,
            ),
            title: 'Entering Animation',
            children: [
              ToggleSwitch(checked: false, onChanged: (x) {}),
            ],
          ),
          const SizedBox(height: 8),
          SettingsMenuSegment(
            leading: const Icon(
              FluentIcons.flag,
              size: 20,
            ),
            title: 'Exit Animation',
            children: [
              ToggleSwitch(checked: false, onChanged: (x) {}),
            ],
          ),
          const SettingsMenuTitle(title: 'Package'),
          SettingsMenuSegment(
            title: 'Package Name',
            leading: const Icon(FluentIcons.package),
            children: [
              SizedBox(
                width: 142,
                child: TextBox(
                  onChanged: (x) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SettingsMenuSegment(
            title: 'Artists',
            leading: const Icon(FluentIcons.people),
            children: [
              SizedBox(
                width: 142,
                child: TextBox(
                  onChanged: (x) {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
