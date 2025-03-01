import 'package:jaspr/ui.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:web/web.dart';

class CodeOfConductPage extends StatelessComponent {
  const CodeOfConductPage({super.key});

  static final path = '/code-of-conducts';

  static final route = Route(
    path: '/code-of-conducts',
    title: 'Code of Conduct',
    builder: (context, state) => CodeOfConductPage(),
  );

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield p([
      text(
        'Flutteristas are dedicated to providing a harassment-free and inclusive experience '
        'for everyone regardless of gender identity and expression, sexual orientation, '
        'disabilities, neurodiversity, physical appearance, body size, ethnicity, '
        'nationality, race, age, religion, or other protected category.',
      )
    ]);
    yield p(
      [
        text(
          'Flutteristas follow the ',
        ),
        a(
          href: 'https://flutter.dev/culture',
          target: Target.blank,
          [text('Google Flutter Culture of Inclusivity policies')],
        ),
        text('.'),
      ],
    );
  }
}

class _ProductItem extends StatefulComponent {
  const _ProductItem({
    required this.image,
    required this.route,
  });

  final String image;
  final Route route;

  @override
  State<_ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<_ProductItem> {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    Unit.em(1);
    yield div(
      classes: 'welcome-item',
      [
        a(
          href: component.route.path,
          events: {
            'click': (Event event) {
              event.preventDefault();
              Router.of(context).push(component.route.path);
            },
          },
          [
            Column(
              children: [
                img(
                  src: component.image,
                  width: 200,
                  height: 200,
                ),
                text(component.route.title!),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
