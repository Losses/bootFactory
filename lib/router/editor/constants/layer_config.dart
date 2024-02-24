import 'package:uuid/uuid.dart';
import 'package:fluent_ui/fluent_ui.dart';

const uuid = Uuid();

class LayerType {
  Widget icon;
  String label;

  LayerType({
    required this.icon,
    required this.label,
  });
}

enum LayerTypeId {
  animation,
  picture,
  fill,
}

Map<LayerTypeId, LayerType> layerTypes = {
  LayerTypeId.animation:
      LayerType(icon: const Icon(FluentIcons.running), label: 'Animation'),
  LayerTypeId.picture:
      LayerType(icon: const Icon(FluentIcons.picture_center), label: 'Picture'),
  LayerTypeId.fill:
      LayerType(icon: const Icon(FluentIcons.background_color), label: 'Fill'),
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
