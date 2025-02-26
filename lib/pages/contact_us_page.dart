import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class ContactUsPage extends StatelessComponent {
  const ContactUsPage._();

  static final route = Route(
    path: '/contact-us',
    title: 'Contact Us',
    builder: (context, state) => ContactUsPage._(),
  );

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield p([
      text(''),
      a(
        href: 'https://fluttercommunity.social/@Flutteristas',
        target: Target.blank,
        [text('Flutter Community Mastodon')],
      ),
    ]);
    yield p([
      text(''),
      a(
        href: 'https://github.com/TheFlutteristas',
        target: Target.blank,
        [text('GitHub')],
      ),
    ]);
    yield p([
      text(''),
      a(
        href: 'https://www.instagram.com/flutteristas/',
        target: Target.blank,
        [text('Instagram')],
      ),
    ]);
    yield p([
      text(''),
      a(
        href: 'https://www.linkedin.com/company/flutteristas',
        target: Target.blank,
        [text('LinkedIn')],
      ),
    ]);
    yield p([
      text(''),
      a(
        href: 'https://twitter.com/Flutteristas',
        target: Target.blank,
        [text('Twitter/X')],
      ),
    ]);
  }
}
