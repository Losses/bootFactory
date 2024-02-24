import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

PaneItem buildPaneItem(PaneItem item, BuildContext context) {
  return PaneItem(
    key: item.key,
    icon: item.icon,
    title: item.title,
    body: item.body,
    onTap: () {
      final path = (item.key as ValueKey).value;
      if (GoRouterState.of(context).uri.toString() != path) {
        context.go(path);
      }
      item.onTap?.call();
    },
  );
}

PaneItem processPanelItem(PaneItem e, BuildContext context) {
  if (e is PaneItemExpander) {
    return PaneItemExpander(
      key: e.key,
      icon: e.icon,
      title: e.title,
      body: e.body,
      items: e.items.map((item) {
        if (item is PaneItem) return buildPaneItem(item, context);
        return item;
      }).toList(),
    );
  }
  if (e is PaneItemHeader) return e;
  return buildPaneItem(e, context);
}
