import 'package:fluent_ui/fluent_ui.dart';
import 'package:reorderables/reorderables.dart';

import './utils/add_layer_modal.dart';
import './components/layer_card.dart';
import './components/add_button.dart';
import './constants/layer_config.dart';

class _EditorState extends State<Editor> {
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
      final c = config.removeAt(oldIndex - 1);
      config.insert(newIndex - 1, c);
    });
  }

  @override
  Widget build(BuildContext context) {
    onAdd() async {
      print(await showAddLayerDialog(context));
    }


    final rows = config
        .map(
          // ignore: unnecessary_cast
          (x) => LayerCard(
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
          child: AddButton(onAdd: onAdd),
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
