import 'dart:html';

import 'package:flutteristas/layout/top_menu.dart';
import 'package:flutteristas/pages/code_of_conduct.dart';
import 'package:flutteristas/pages/privacy_page.dart';
import 'package:jaspr/html.dart';
import 'package:jaspr_router/jaspr_router.dart';

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
      classes: ['page'],
      [
        header([
          div([
            div(classes: [
              'top-bar'
            ], [
              followUsSection(),
              a(
                classes: ['button'],
                href:
                    'https://docs.google.com/forms/d/e/1FAIpQLScR2hQ44u_zxgpOaxcZZAnOmVZoIllehX8Iv9HKot2KmIMxzA/viewform',
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
                  'srcset': //
                      '/images/flutterista_logo_white_outline_150.png, '
                      '/images/flutterista_logo_white_outline_225.png 1.5x, '
                      '/images/flutterista_logo_white_outline_300.png 2x, '
                      '/images/flutterista_logo_white_outline_600.png 3x',
                },
              )
            ], href: '/'),
            TopMenu()
          ]),
        ]),
        article([
          div(id: 'post-content', [
            if (_title case String title) //
              h1(classes: [title], [text(title)]),
            component.child,
          ]),
        ]),
        footer([
          followUsSection(),
          div(classes: [
            'privacy-section'
          ], [
            a(
              href: PrivacyPolicyPage.route.path,
              events: {
                'click': (event) {
                  Router.of(context).push(PrivacyPolicyPage.route.path);
                  (event as Event).preventDefault();
                },
              },
              [text('Privacy policy')],
            ),
            a(
              href: CodeOfConduct.route.path,
              events: {
                'click': (event) {
                  Router.of(context).push(CodeOfConduct.route.path);
                  (event as Event).preventDefault();
                },
              },
              [
                text('Code of conduct'),
              ],
            )
          ]),
          p([text('Copyright © 2023 Flutteristas.org.  All rights reserved.')]),
        ]),
      ],
    );
  }

  Component followUsSection() {
    return div(classes: [
      'follow-us'
    ], [
      p([text('Follow us:')]),
      div(classes: [
        'social-media'
      ], [
        a([
          img(
              classes: ['social-icon'],
              src: '/images/Linkedin.svg',
              alt: 'linkedin-icon')
        ],
            target: Target.blank,
            href: 'https://www.linkedin.com/company/flutteristas/'),
        a([
          img(
              classes: ['social-icon'],
              src: '/images/x-logo.svg',
              alt: 'twitter-icon')
        ], target: Target.blank, href: 'https://twitter.com/flutteristas'),
        a([
          img(
              classes: ['social-icon'],
              src: '/images/Mastodon.svg',
              alt: 'mastodon-icon')
        ],
            target: Target.blank,
            href: 'https://fluttercommunity.social/@Flutteristas'),
        a([
          img(
              classes: ['social-icon'],
              src: '/images/instagram.svg',
              alt: 'instagram-icon')
        ],
            target: Target.blank,
            href: 'https://www.instagram.com/flutteristas/'),
        a([
          img(
              classes: ['social-icon'],
              src: '/images/youtube.svg',
              alt: 'youtube-icon')
        ], target: Target.blank, href: 'https://www.youtube.com/@Flutteristas'),
        a([
          img(
              classes: ['social-icon'],
              src: '/images/github-color-svgrepo-com.svg',
              alt: 'github-icon')
        ], target: Target.blank, href: 'https://github.com/TheFlutteristas'),
        a([
          img(
              classes: ['social-icon'],
              src: '/images/facebook-svgrepo-com.svg',
              alt: 'facebook-icon')
        ],
            target: Target.blank,
            href:
                'https://www.facebook.com/people/Flutteristas/61552442970613/'),
        a([
          img(
              classes: ['social-icon'],
              src: '/images/bluesky-icon.svg',
              alt: 'facebook-icon')
        ],
            target: Target.blank,
            href: 'https://bsky.app/profile/flutteristas.org')
      ])
    ]);
  }
}
