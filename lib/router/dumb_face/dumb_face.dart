import 'package:provider/provider.dart';
import 'package:fluent_ui/fluent_ui.dart';

import './dumb_face_state.dart';

class DumbFaceControl extends StatelessWidget {
  const DumbFaceControl({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: DumbFaceState(),
        builder: (context, child) {
          return const DumbFaceSwitcher();
        });
  }
}

class DumbFaceSwitcher extends StatelessWidget {
  const DumbFaceSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<DumbFaceState>();
    var disabled = appState.disabled;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DumbFace(disabled: disabled),
          const SizedBox(
            height: 4,
          ),
          Button(
            onPressed: appState.toggle,
            child: const Text('Flip'),
          ),
        ],
      ),
    );
  }
}

class DumbFace extends StatelessWidget {
  const DumbFace({
    super.key,
    required this.disabled,
  });

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        child: Text(disabled ? "ˊ<_ˋ" : "ˊ_>ˋ"),
      ),
    );
  }
}
