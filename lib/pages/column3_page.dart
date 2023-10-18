import 'dart:html';

import 'package:jaspr/components.dart';
import 'package:jaspr/html.dart';
import 'package:jaspr_router/jaspr_router.dart';

class Column3Page extends StatelessComponent {
  const Column3Page({super.key});

  static final route = Route(
    path: '/column-page3',
    title: '3 Column Page',
    builder: (context, state) => Column3Page(),
  );

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Text(
      'This is a sample using 3 columns: ',
    );
    yield br();
    yield br();
    yield div(
      id: 'column-items-3cols',
      [
        p([
          text('Column 1 '),
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
        p([
          text('Column 3'),
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

class _ColumnItem extends StatefulComponent {
  const _ColumnItem({
    required this.image,
    required this.route,
  });

  final String image;
  final Route route;

  @override
  State<_ColumnItem> createState() => _ColumnItemState();
}

class _ColumnItemState extends State<_ColumnItem> {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    Unit.em(1);
    yield div(
      classes: ['column-item'],
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
