import 'dart:html';

import 'package:jaspr/components.dart';
import 'package:jaspr/html.dart';
import 'package:jaspr_router/jaspr_router.dart';

class TwoSectionPage extends StatelessComponent {
  const TwoSectionPage({super.key});

  static final route = Route(
    path: '/two-section-page',
    title: 'Two Section Page',
    builder: (context, state) => TwoSectionPage(),
  );

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      id: 'column-item',
      [
        p([
          text('SECTION 1'),
          br(),
          br(),
          text('Ac odio tempor orci dapibus ultrices in. '
              'Sit amet mauris commodo quis imperdiet. Nulla facilisi '
              'morbi tempus iaculis. In tellus integer feugiat scelerisque. '
              'Nec dui nunc mattis enim ut. Dui faucibus in ornare quam '
              'viverra orci. Sit amet justo donec enim diam vulputate ut '
              'pharetra sit. Vivamus at augue eget arcu. '),
        ]),
      ],
    );
    yield br();
    yield div(
      id: 'column-items-2cols',
      [
        p([
          text('SECTION 2'),
          br(),
          br(),
        ]),
      ],
    );
    yield div(
      id: 'column-items-2cols',
      [
        p([
          text('Column 1'),
          br(),
          br(),
          text('Ac odio tempor orci dapibus ultrices in. '
              'Sit amet mauris commodo quis imperdiet. Nulla facilisi '
              'morbi tempus iaculis. In tellus integer feugiat scelerisque. '
              'Nec dui nunc mattis enim ut. Dui faucibus in ornare quam '
              'viverra orci. Sit amet justo donec enim diam vulputate ut '
              'pharetra sit. Vivamus at augue eget arcu. '),
        ]),
        p([
          text('Column 2'),
          br(),
          br(),
          text('Ac odio tempor orci dapibus ultrices in. '
              'Sit amet mauris commodo quis imperdiet. Nulla facilisi '
              'morbi tempus iaculis. In tellus integer feugiat scelerisque. '
              'Nec dui nunc mattis enim ut. Dui faucibus in ornare quam '
              'viverra orci. Sit amet justo donec enim diam vulputate ut '
              'pharetra sit. Vivamus at augue eget arcu. '),
        ]),
      ],
    );
  }
}

class _TwoSection extends StatefulComponent {
  const _TwoSection({
    required this.image,
    required this.route,
  });

  final String image;
  final Route route;

  @override
  State<_TwoSection> createState() => _TwoSectionItemState();
}

class _TwoSectionItemState extends State<_TwoSection> {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    Unit.em(1);
    yield div(
      classes: ['two-section-item'],
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
