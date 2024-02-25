import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

class Recent extends StatelessWidget {
  const Recent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
        child: const Text('Edit item'),
        onPressed: () {
          context.push('/edit/xx1/main');
        });
  }
}
