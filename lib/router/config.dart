import 'package:boot_factory/router/editor/_store/editor_context.dart';
import 'package:boot_factory/router/editor/shell.dart';
import 'package:boot_factory/router/recent/index.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

import 'index.dart';
import 'editor/editor_index.dart';
import './editor/layers/layers_editor.dart';
import './editor/package/package_editor.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _mainShellNavigatorKey = GlobalKey<NavigatorState>();
final _editorShellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  // debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      navigatorKey: _mainShellNavigatorKey,
      builder: (context, state, child) {
        return MainNavigation(
          shellContext: _mainShellNavigatorKey.currentContext,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Recent(),
        ),
        GoRoute(
          path: '/edit/:project_id',
          redirect: (context, state) {
            return null;
          },
          routes: [
            ShellRoute(
              navigatorKey: _editorShellNavigatorKey,
              builder: (context, state, child) {
                editorContext.setId(state.pathParameters['project_id']);
                return EditorShell(child: child);
              },
              routes: [
                GoRoute(
                  path: 'main',
                  builder: (context, state) => const EditorIndex(),
                ),
                GoRoute(
                  path: 'package_editor',
                  builder: (context, state) => const PackageEditor(),
                ),
                GoRoute(
                  path: 'layer_editor',
                  builder: (context, state) => const LayersEditor(),
                ),
              ],
            )
          ],
        ),
      ],
    ),
  ],
);
