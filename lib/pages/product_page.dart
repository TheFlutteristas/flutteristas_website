import 'dart:html';

import 'package:flutteristas/pages/product_page_1.dart';
import 'package:flutteristas/pages/product_page_note.dart';
import 'package:jaspr/components.dart';
import 'package:jaspr/html.dart';
import 'package:jaspr_router/jaspr_router.dart';

class ProductSummaryPage extends StatelessComponent {
  const ProductSummaryPage({super.key});

  static final route = Route(
    path: '/product-list',
    title: 'Products ',
    builder: (context, state) => ProductSummaryPage(),
  );

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Text(
      'Hover over images or captions to see text change '
      'bolding to show selection.',
    );
    yield br();
    yield br();
    yield Text(
      'Click on each image to learn more about each of '
      'our mobile apps.',
    );
    yield div(
      id: 'product-items',
      [
        _ProductItem(
          image: '/images/placeholder_1.png',
          route: ProductPageOne.route,
        ),
        _ProductItem(
          image: '/images/placeholder_2.png',
          route: ProductPageWithNote.route,
        ),
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
  State<_ProductItem> createState() => _WelcomeItemState();
}

class _WelcomeItemState extends State<_ProductItem> {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    Unit.em(1);
    yield div(
      classes: ['product-item'],
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
