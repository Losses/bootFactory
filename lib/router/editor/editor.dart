import 'package:boot_factory/router/editor/constants/layer_config.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:reorderables/reorderables.dart';

import './components/layer_card.dart';

class _EditorState extends State<Editor> {
  late List<Widget> _rows;

  onChanged() {
    setState(() {
      _rows = [
        LayerCard(
          key: const ValueKey('animation'),
          config: config,
          onChanged: onChanged,
          onAdd: onAdd,
          onExpand: onChanged,
        ),
        LayerCard(
          key: const ValueKey('picture'),
          config: config,
          onChanged: onChanged,
          onAdd: onAdd,
          onExpand: onChanged,
        ),
        LayerCard(
          key: const ValueKey('fill'),
          config: config,
          onChanged: onChanged,
          onAdd: onAdd,
          onExpand: onChanged,
        ),
      ];
    });
  }

  LayerConfig config = LayerConfig<int>(
    type: LayerTypeId.animation,
    W: 50,
    H: 50,
    X: 50,
    Y: 50,
    detail: 0,
  );

  onAdd() {}

  @override
  void initState() {
    super.initState();

    _rows = [
      LayerCard(
        key: const ValueKey('animation'),
        config: config,
        onChanged: onChanged,
        onAdd: onAdd,
        onExpand: onChanged,
      ),
      LayerCard(
        key: const ValueKey('picture'),
        config: config,
        onChanged: onChanged,
        onAdd: onAdd,
        onExpand: onChanged,
      ),
      LayerCard(
        key: const ValueKey('fill'),
        config: config,
        onChanged: onChanged,
        onAdd: onAdd,
        onExpand: onChanged,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    void onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _rows.removeAt(oldIndex);
        _rows.insert(newIndex, row);
      });
    }

    ScrollController scrollController = PrimaryScrollController.of(context);

    return CustomScrollView(
      controller: scrollController,
      slivers: <Widget>[
        ReorderableSliverList(
          delegate: ReorderableSliverChildListDelegate(_rows),
          onReorder: onReorder,
        )
      ],
    );
  }
}

class Editor extends StatefulWidget {
  const Editor({super.key});

  @override
  createState() => _EditorState();
}
