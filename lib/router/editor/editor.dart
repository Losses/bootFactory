import 'package:fluent_ui/fluent_ui.dart';
import 'package:collection/collection.dart';
import 'package:reorderables/reorderables.dart';

import './utils/add_layer_modal.dart';
import './components/layer_card.dart';
import './components/add_button.dart';
import './constants/layer_config.dart';

class _EditorState extends State<Editor> {
  onChanged() {
    setState(() {});
  }

  List<LayerConfig> config = [];

  @override
  void initState() {
    super.initState();
  }

  void onReorder(int oldIndex, int newIndex) {
    if (newIndex - 1 < 0 || oldIndex - 1 < 0) {
      return;
    }

    setState(() {
      final c = config.removeAt(oldIndex - 1);
      config.insert(newIndex - 1, c);
    });
  }

  @override
  Widget build(BuildContext context) {
    onAdd(int index) async {
      final animation = config.indexWhere(
        (element) => element.type == LayerTypeId.animation,
      );

      final type = await showAddLayerDialog(animation >= 0, context);

      if (type == null) return;

      config.insert(index + 1, layerConfigTemplates[type]!.clone());
      
      setState(() {});
    }

    final rows = config
        .mapIndexed(
          // ignore: unnecessary_cast
          (i, x) => LayerCard(
            index: i,
            key: ValueKey(x.id!),
            config: x,
            onChanged: onChanged,
            onAdd: onAdd,
            onExpand: onChanged,
          ) as Widget,
        )
        .toList();

    rows.insert(
      0,
      Center(
        child: GestureDetector(
          onLongPress: () {}, // Override onLongPress to make item unmovable.
          child: AddButton(
            index: -1,
            onAdd: onAdd,
          ),
        ),
      ),
    );

    ScrollController scrollController = PrimaryScrollController.of(context);

    return CustomScrollView(
      controller: scrollController,
      slivers: <Widget>[
        ReorderableSliverList(
          delegate: ReorderableSliverChildListDelegate(rows),
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
