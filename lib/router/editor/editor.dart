import 'package:boot_factory/router/editor/utils/add_layer_modal.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:reorderables/reorderables.dart';

import './components/layer_card.dart';
import './constants/layer_config.dart';

class _EditorState extends State<Editor> {
  late List<Widget> _rows;

  onChanged() {
    setState(() {});
  }

  List<LayerConfig> config = [
    LayerConfig<int>(
      type: LayerTypeId.animation,
      W: 50,
      H: 50,
      X: 50,
      Y: 50,
      detail: 0,
    ),
    LayerConfig<int>(
      type: LayerTypeId.fill,
      W: 50,
      H: 50,
      X: 50,
      Y: 50,
      detail: 0,
    ),
    LayerConfig<int>(
      type: LayerTypeId.picture,
      W: 50,
      H: 50,
      X: 50,
      Y: 50,
      detail: 0,
    )
  ];

  @override
  void initState() {
    super.initState();
  }

  void onReorder(int oldIndex, int newIndex) {
    setState(() {
      final c = config.removeAt(oldIndex);
      config.insert(newIndex, c);
    });
  }

  @override
  Widget build(BuildContext context) {
    onAdd() async {
      print(await showAddLayerDialog(context));
    }

    _rows = config
        .map(
          (x) => LayerCard(
            key: ValueKey(x.id!),
            config: x,
            onChanged: onChanged,
            onAdd: onAdd,
            onExpand: onChanged,
          ),
        )
        .toList();

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
