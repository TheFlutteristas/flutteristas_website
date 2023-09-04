import 'package:jaspr/components.dart';
import 'package:jaspr/html.dart';

class ProductLayout extends StatelessComponent {
  const ProductLayout({
    super.key,
    required this.image,
    this.appStoreUrl = '',
    this.playStoreUrl = '',
    this.withFlutter = false,
    required this.children,
  });

  final String image;
  final String appStoreUrl;
  final String playStoreUrl;
  final bool withFlutter;
  final List<Component> children;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Column(
      children: [
        Spacer(height: Unit.em(0.5)),
        div(
          classes: ['product-layout'],
          [
            div(
              classes: ['product-layout-icon'],
              [
                img(
                  src: image,
                  styles: Styles.box(
                    width: Unit.percent(100),
                  ),
                ),
              ],
            ),
            div(
              classes: ['product-layout-content'],
              children,
            ),
          ],
        ),
        Spacer(height: Unit.em(2)),
        div(
          classes: ['product-layout-links'],
          [
            if (appStoreUrl.isNotEmpty) //
              a(
                href: appStoreUrl,
                target: Target.blank,
                [
                  img(src: '/images/ios_app_store.png', height: 54),
                ],
              ),
            if (playStoreUrl.isNotEmpty) //
              a(
                href: playStoreUrl,
                target: Target.blank,
                [
                  img(src: '/images/google_play_store.png', height: 54),
                ],
              ),
          ],
        ),
        Spacer(height: Unit.em(2)),
        if (withFlutter)
          div(
            styles: Styles.combine([
              Styles.flexbox(
                direction: FlexDirection.column,
                justifyContent: JustifyContent.center,
              ),
              Styles.text(
                align: TextAlign.center,
              ),
            ]),
            [
              p([text('Made with a single codebase using the Flutter SDK by Google')]),
              div([
                a(
                  href: 'https://flutter.dev/',
                  target: Target.blank,
                  [img(src: '/images/flutter.png', height: 54)],
                )
              ]),
              Spacer(height: Unit.em(1)),
              p(
                styles: Styles.text(
                  fontSize: Unit.rem(0.8),
                  color: Colors.gray,
                ),
                [
                  text(
                    'Flutter and the related logo are trademarks of Google LLC.<br>'
                    'We are not endorsed by or affiliated with Google LLC.',
                    rawHtml: true,
                  )
                ],
              ),
            ],
          ),
      ],
    );
  }
}
