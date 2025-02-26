import 'package:flutteristas/layout/page_frame.dart';
//import 'package:flutteristas/pages/agenda_page.dart';
import 'package:flutteristas/pages/code_of_conduct.dart';
// import 'package:flutteristas/pages/column2_page.dart';
// import 'package:flutteristas/pages/column3_page.dart';
//import 'package:flutteristas/pages/contact_us_page.dart';
import 'package:flutteristas/pages/flutteristas_conference.dart';
import 'package:flutteristas/pages/flutteristas_map.dart';
// import 'package:flutteristas/pages/follow_us_page.dart';
import 'package:flutteristas/pages/not_found_page.dart';
import 'package:flutteristas/pages/privacy_page.dart';
// import 'package:flutteristas/pages/two_sections.dart';
import 'package:flutteristas/pages/welcome_page.dart';
// import 'package:flutteristas/pages/product_page_1.dart';
// import 'package:flutteristas/pages/product_page_note.dart';
//import 'package:flutteristas/pages/product_page.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

final routes = [
  WelcomePage.route,
  FlutteristasConferencePage.route,
  // AgendaPage.route,
  // TwoSectionPage.route,
  // Column2Page.route,
  // Column3Page.route,
  // ProductSummaryPage.route,
  // ProductPageOne.route,
  // ProductPageWithNote.route,
  // FollowUsPage.route,
  // ContactUsPage.route,
  FlutteristasMap.route,
  CodeOfConduct.route,
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
