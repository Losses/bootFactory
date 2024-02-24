import 'package:uuid/uuid.dart';
import 'package:fluent_ui/fluent_ui.dart';

const uuid = Uuid();

class LayerType {
  LayerTypeId id;
  IconData icon;
  String label;
  String description;

  LayerType({
    required this.id,
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
    id: LayerTypeId.animation,
    icon: FluentIcons.running,
    label: 'Animation',
    description: 'An animated image, could be gif, webp, apng file.',
  ),
  LayerTypeId.picture: LayerType(
    id: LayerTypeId.picture,
    icon: FluentIcons.picture_center,
    label: 'Picture',
    description: 'A still image, could be a logo or a background.',
  ),
  LayerTypeId.fill: LayerType(
    id: LayerTypeId.fill,
    icon: FluentIcons.background_color,
    label: 'Fill',
    description: 'A square shape with given color, with alpha value.',
  ),
};

Map<LayerTypeId, LayerConfig> layerConfigTemplates = {
  LayerTypeId.animation: LayerConfig<int>(
    type: LayerTypeId.animation,
    W: 50,
    H: 50,
    X: 50,
    Y: 50,
    detail: 0,
  ),
  LayerTypeId.picture: LayerConfig<int>(
    type: LayerTypeId.picture,
    W: 50,
    H: 50,
    X: 50,
    Y: 50,
    detail: 0,
  ),
  LayerTypeId.fill: LayerConfig<int>(
    type: LayerTypeId.fill,
    W: 50,
    H: 50,
    X: 50,
    Y: 50,
    detail: 0,
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
      W: W,
      H: H,
      X: X,
      Y: Y,
      detail: detail,
    );
  }
}
