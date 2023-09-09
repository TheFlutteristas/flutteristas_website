import 'package:flutteristas/layout/page_frame.dart';
import 'package:flutteristas/pages/flutteristas_conference.dart';

import 'package:flutteristas/pages/follow_us_page.dart';
import 'package:flutteristas/pages/not_found_page.dart';
import 'package:flutteristas/pages/privacy_page.dart';
import 'package:flutteristas/pages/welcome_page.dart';

import 'package:jaspr/components.dart';
import 'package:jaspr/html.dart';
import 'package:jaspr_router/jaspr_router.dart';

final routes = [
  WelcomePage.route,
  FlutteristasConferencePage.route,
  FollowUsPage.route,
  PrivacyPolicyPage.route,
];

class App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Router(
      routes: [
        ShellRoute(
          routes: routes,
          builder: (BuildContext context, RouteState state, Component child) {
            return PageFrame(child: child);
          },
        ),
      ],
      errorBuilder: NotFoundPage.builder,
    );
  }
}
