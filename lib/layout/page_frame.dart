import 'package:flutteristas/layout/top_menu.dart';
import 'package:flutteristas/pages/code_of_conduct_page.dart';
import 'package:flutteristas/pages/privacy_page.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:jaspr/jaspr.dart';
import 'package:web/web.dart';

class PageFrame extends StatefulComponent {
  const PageFrame({
    super.key,
    required this.child,
  });

  final Component child;

  @override
  State<PageFrame> createState() => _PageFrameState();
}

class _PageFrameState extends State<PageFrame> {
  String? _title;

  @override
  void initState() {
    super.initState();
    _updateTitle();
  }

  @override
  void didUpdateComponent(covariant PageFrame oldComponent) {
    super.didUpdateComponent(oldComponent);
    _updateTitle();
  }

  void _updateTitle() {
    _title = Router.of(context).matchList.title;
    if (_title case String title) {
      document.title = '$title :: Flutteristas';
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'page',
      [
        header([
          div([
            div(classes: 'top-bar', [
              followUsSection(),
              a(
                classes: 'button',
                href: 'https://docs.google.com/forms'
                    '/d/e/1FAIpQLScR2hQ44u_zxgpOaxcZZAnOmVZoIllehX8Iv9HKot2KmIMxzA/viewform',
                target: Target.blank,
                [text('Join our community')],
              )
            ]),
          ]),
          div([
            a([
              img(
                alt: 'Flutteristas',
                src: '/images/flutterista_logo_white_outline_600.png',
                attributes: {
                  'srcset': [
                    '/images/flutterista_logo_white_outline_150.png',
                    '/images/flutterista_logo_white_outline_225.png 1.5x',
                    '/images/flutterista_logo_white_outline_300.png 2x',
                    '/images/flutterista_logo_white_outline_600.png 3x',
                  ].join(', '),
                },
              )
            ], href: '/'),
            TopMenu()
          ]),
        ]),
        article([
          div(id: 'post-content', [
            if (_title case String title) //
              h1(classes: title, [text(title)]),
            component.child,
          ]),
        ]),
        footer([
          followUsSection(),
          div(classes: 'privacy-section', [
            a(
              href: PrivacyPolicyPage.route.path,
              events: {
                'click': (event) {
                  event.preventDefault();
                  Router.of(context).push(PrivacyPolicyPage.route.path);
                },
              },
              [text('Privacy policy')],
            ),
            a(
              href: CodeOfConductPage.route.path,
              events: {
                'click': (event) {
                  event.preventDefault();
                  Router.of(context).push(CodeOfConductPage.route.path);
                },
              },
              [
                text('Code of conduct'),
              ],
            )
          ]),
          p([
            text(
                'Copyright © ${DateTime.now().year} Flutteristas.org.  All rights reserved.')
          ]),
        ]),
      ],
    );
  }

  Component followUsSection() {
    return div(classes: 'follow-us', [
      p([text('Follow us:')]),
      div(classes: 'social-media', [
        for (final (:altText, :imageSrc, :href)
            in <({String altText, String imageSrc, String href})>[
          (
            altText: 'LinkedIn',
            imageSrc: '/images/Linkedin.svg',
            href: 'https://www.linkedin.com/company/flutteristas/',
          ),
          (
            altText: 'Twitter',
            imageSrc: '/images/x-logo.svg',
            href: 'https://twitter.com/flutteristas',
          ),
          (
            altText: 'Mastodon',
            imageSrc: '/images/Mastodon.svg',
            href: 'https://fluttercommunity.social/@Flutteristas',
          ),
          (
            altText: 'Instagram',
            imageSrc: '/images/instagram.svg',
            href: 'https://www.instagram.com/flutteristas/',
          ),
          (
            altText: 'YouTube',
            imageSrc: '/images/youtube.svg',
            href: 'https://www.youtube.com/@Flutteristas',
          ),
          (
            altText: 'GitHub',
            imageSrc: '/images/github-color-svgrepo-com.svg',
            href: 'https://github.com/TheFlutteristas',
          ),
          (
            altText: 'Facebook',
            imageSrc: '/images/facebook-svgrepo-com.svg',
            href:
                'https://www.facebook.com/people/Flutteristas/61552442970613/',
          ),
          (
            altText: 'Bluesky',
            imageSrc: '/images/bluesky-icon.svg',
            href: 'https://bsky.app/profile/flutteristas.org',
          ),
        ]) //
          a(
            [img(classes: 'social-icon', src: imageSrc, alt: altText)],
            target: Target.blank,
            href: href,
          ),
      ])
    ]);
  }
}
