import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

import '../../utils/is_desktop.dart';

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

    return SizedBox(
      width: 138,
      height: 50,
      child: WindowCaption(
        brightness: theme.brightness,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class WindowController extends StatelessWidget {
  const WindowController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Padding(
          padding: EdgeInsetsDirectional.only(end: 8.0),
        ),
      ),
      WindowButtons(),
    ]);
  }
}

class NavigationActions extends StatefulWidget {
  const NavigationActions({
    super.key,
  });

  @override
  State<NavigationActions> createState() => _NavigationActionsState();
}

class _NavigationActionsState extends State<NavigationActions> {
  final logoutFlyoutController = FlyoutController();
  final userCredentController = TextEditingController();

  @override
  void dispose() {
    logoutFlyoutController.dispose();
    userCredentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        isDesktop ? const SizedBox(
          width: 12,
        ) : Container(),
        const Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: 8),
          ),
        ),
        isDesktop ? const WindowButtons() : Container(),
      ],
    );
  }
}
