import 'dart:html';

import 'package:jaspr/components.dart';
import 'package:jaspr/html.dart';
import 'package:jaspr_router/jaspr_router.dart';

class WelcomePage extends StatelessComponent {
  const WelcomePage({super.key});

  static final route = Route(
    path: '/',
    title: 'Welcome',
    builder: (context, state) => WelcomePage(),
  );

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Text(
      'Thanks for stopping by! 💙💜',
    );
    yield br();
    yield br();
    yield Text(
      '',
    );

    yield p([
      text('The Flutteristas is a world-wide community of people whose gender identity is either female or non-binary and '
          'have an interest in the Flutter SDK.💙 If you\'re female or non-binary, have in interest in Flutter, and interested '
          'in joining, you can apply '),
      a(
        href: 'https://docs.google.com/forms/d/e/1FAIpQLScR2hQ44u_zxgpOaxcZZAnOmVZoIllehX8Iv9HKot2KmIMxzA/viewform',
        target: Target.blank,
        [text('here')],
      ),
      text('.'),
    ]);
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
      classes: ['welcome-item'],
      [
        a(
          href: component.route.path,
          events: {
            'click': (event) {
              Router.of(context).push(component.route.path);
              (event as Event).preventDefault();
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
