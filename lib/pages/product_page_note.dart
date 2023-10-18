import 'package:flutteristas/layout/product_layout.dart';
import 'package:jaspr/html.dart';
import 'package:jaspr_router/jaspr_router.dart';

class ProductPageWithNote extends StatelessComponent {
  const ProductPageWithNote._();

  static final route = Route(
    path: '/product-page-3',
    title: 'Product Page with Note',
    builder: (context, state) => ProductPageWithNote._(),
  );

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ProductLayout(
      image: '/images/placeholder_3.png',
      //appStoreUrl: '', // FIXME: add app store url when we have an app
      // playStoreUrl: '', // FIXME: add play store url when we have an app
      withFlutter: true,
      children: [
        p([
          text(
            'Text for page with note and Flutter reference.',
          ),
        ]),
        p([
          text('Maecenas accumsan lacus vel facilisis volutpat est velit. '
              'Non consectetur a erat nam at lectus urna duis convallis. '
              'Tellus in hac habitasse platea dictumst vestibulum. '),
        ]),
        br(),
        p(
          styles: Styles.combine([
            Styles.box(
              border: Border.only(
                left: BorderSide(
                  //color: Colors.darkSlateBlue,
                  color: Color.hex('#883CC7'),
                  width: Unit.em(0.5),
                  style: BorderStyle.solid,
                ),
              ),
              padding: EdgeInsets.only(left: Unit.em(1)),
            ),
            Styles.text(
              //color: Colors.darkSlateBlue,
              color: Color.hex('#883CC7'),
            ),
          ]),
          [
            i([
              text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed '
                'do eiusmod tempor incididunt ut labore et dolore magna '
                'aliqua. Ut enim ad minim veniam, quis nostrud exercitation '
                'ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                'Duis aute irure dolor in reprehenderit in voluptate velit esse ',
              ),
            ]),
          ],
        ),
      ],
    );
  }
}
