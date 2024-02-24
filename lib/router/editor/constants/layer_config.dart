import 'package:uuid/uuid.dart';
import 'package:fluent_ui/fluent_ui.dart';

const uuid = Uuid();

class LayerType {
  IconData icon;
  String label;
  String description;

  LayerType({
    required this.icon,
    required this.label,
    required this.description,
  });
}

enum LayerTypeId {
  animation,
  picture,
  fill,
}

Map<LayerTypeId, LayerType> layerTypes = {
  LayerTypeId.animation: LayerType(
    icon: FluentIcons.running,
    label: 'Animation',
    description: 'An animated image, could be gif, webp, apng file.',
  ),
  LayerTypeId.picture: LayerType(
    icon: FluentIcons.picture_center,
    label: 'Picture',
    description: 'A still image, could be a logo or a background.',
  ),
  LayerTypeId.fill: LayerType(
    icon: FluentIcons.background_color,
    label: 'Fill',
    description: 'A square shape with given color, with alpha value.',
  ),
};

class LayerConfig<T> {
  T detail;
  LayerTypeId type;
  double W;
  double H;
  double X;
  double Y;
  bool open;
  String? id;

  LayerConfig({
    this.id,
    this.open = false,
    required this.type,
    required this.W,
    required this.H,
    required this.X,
    required this.Y,
    required this.detail,
  }) {
    id ??= uuid.v4().toString();
  }

  clone() {
    return LayerConfig<T>(
      type: this.type,
      id: this.id,
      W: W,
      H: H,
      X: X,
      Y: Y,
      detail: detail,
    );
  }
}
