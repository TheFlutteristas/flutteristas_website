import 'package:jaspr/html.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class NotFoundPage extends StatelessComponent {
  const NotFoundPage._();

  static Component builder(BuildContext context, RouteState state) {
    return NotFoundPage._();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: [
      'not-found'
    ], [
      h1([text('Page Not Found')])
    ]);
  }
}
