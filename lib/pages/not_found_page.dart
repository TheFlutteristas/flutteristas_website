import 'package:jaspr/ui.dart';
import 'package:jaspr_router/jaspr_router.dart';

class NotFoundPage extends StatelessComponent {
  const NotFoundPage._();

  static Component builder(BuildContext context, RouteState state) {
    return NotFoundPage._();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Center(
      children: [Text('Not Found')],
    );
  }
}
