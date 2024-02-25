import 'dart:io';

import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:window_manager/window_manager.dart';

import './config.dart';
import '../theme.dart';
import '../navigation.dart';
import '../utils/is_desktop.dart';
import '../constant/app_title.dart';
import '../utils/build_pane_item.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({
    super.key,
    required this.child,
    required this.shellContext,
  });

  final Widget child;
  final BuildContext? shellContext;

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> with WindowListener {
  bool value = false;

  int index = 0;

  final viewKey = GlobalKey(debugLabel: 'Navigation View Key');

  late final List<NavigationPaneItem> originalItems = [
    PaneItem(
      key: const ValueKey('/'),
      icon: const Icon(FluentIcons.home),
      title: const Text('Home'),
      body: const SizedBox.shrink(),
    ),
  ].map<NavigationPaneItem>((e) => processPanelItem(e, context)).toList();

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = FluentLocalizations.of(context);

    final appTheme = context.watch<AppTheme>();
    if (widget.shellContext != null) {
      if (router.canPop() == false) {
        setState(() {});
      }
    }
    return NavigationView(
      key: viewKey,
      appBar: NavigationAppBar(
        automaticallyImplyLeading: false,
        leading: () {
          if (!Platform.isWindows) {
            return null;
          }

          final enabled = widget.shellContext != null && router.canPop();

          final onPressed = enabled
              ? () {
                  if (router.canPop()) {
                    context.pop();
                    setState(() {});
                  }
                }
              : null;
          return NavigationPaneTheme(
            data: NavigationPaneTheme.of(context).merge(
              NavigationPaneThemeData(
                unselectedIconColor: ButtonState.resolveWith(
                  (states) {
                    if (states.isDisabled) {
                      return ButtonThemeData.buttonColor(context, states);
                    }
                    return ButtonThemeData.uncheckedInputColor(
                      FluentTheme.of(context),
                      states,
                    ).basedOnLuminance();
                  },
                ),
              ),
            ),
            child: Builder(
              builder: (context) => PaneItem(
                icon: const Center(child: Icon(FluentIcons.back, size: 12.0)),
                title: Text(localizations.backButtonTooltip),
                body: const SizedBox.shrink(),
                enabled: enabled,
              ).build(
                context,
                false,
                onPressed,
                displayMode: PaneDisplayMode.compact,
              ),
            ),
          );
        }(),
        title: () {
          return DragToMoveArea(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Row(
                children: [
                  isDesktop
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: Image(
                            image: AssetImage('assets/icons/app.png'),
                            filterQuality: FilterQuality.medium,
                            isAntiAlias: true,
                          ),
                        )
                      : Container(),
                  isDesktop
                      ? const SizedBox(
                          width: 16,
                        )
                      : Container(),
                  const Text(appTitle),
                ],
              ),
            ),
          );
        }(),
        actions: const NavigationActions(),
      ),
      paneBodyBuilder: (item, child) {
        final name =
            item?.key is ValueKey ? (item!.key as ValueKey).value : null;
        return FocusTraversalGroup(
          key: ValueKey('body$name'),
          child: widget.child,
        );
      },
      pane: NavigationPane(
        selected: index,
        onChanged: (i) => setState(() => index = i),
        displayMode: appTheme.displayMode,
        indicator: const StickyNavigationIndicator(),
        items: originalItems,
      ),
    );
  }

  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose && mounted) {
      showDialog(
        context: context,
        builder: (_) {
          return ContentDialog(
            title: const Text('Confirm close'),
            content: const Text('Are you sure you want to close this window?'),
            actions: [
              FilledButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.pop(context);
                  windowManager.destroy();
                },
              ),
              Button(
                child: const Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
}
