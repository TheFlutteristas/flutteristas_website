import 'package:flutteristas/layout/product_layout.dart';
import 'package:jaspr/html.dart';
import 'package:jaspr_router/jaspr_router.dart';

class ProductPageOne extends StatelessComponent {
  const ProductPageOne._();

  static final route = Route(
    path: '/product-page-one',
    title: 'Product 1 Detail',
    builder: (context, state) => ProductPageOne._(),
  );

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ProductLayout(
      image: '/images/placeholder_1.png',
      //appStoreUrl: '', // FIXME: add app store url when we have an app
      // playStoreUrl: '', // FIXME: add play store url when we have an app
      children: [
        text(
          'This page is all about Product 1.',
        ),
        br(),
        br(),
        p([
          text('Maecenas accumsan lacus vel facilisis volutpat est velit. '
              'Non consectetur a erat nam at lectus urna duis convallis. '
              'Tellus in hac habitasse platea dictumst vestibulum. '),
        ]),
      ],
    );
  }
}
