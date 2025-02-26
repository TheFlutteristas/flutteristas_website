import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class FollowUsPage extends StatelessComponent {
  const FollowUsPage._();

  static final route = Route(
    path: '/follow-us',
    title: 'Follow Us',
    builder: (context, state) => FollowUsPage._(),
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
