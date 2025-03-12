import 'package:flutteristas/app/data_fetcher.dart';
import 'package:flutteristas/layout/page_frame.dart';
import 'package:flutteristas/pages/code_of_conduct_page.dart';
import 'package:flutteristas/pages/flutteristas_conference_page.dart';
import 'package:flutteristas/pages/flutteristas_map_page.dart';
import 'package:flutteristas/pages/not_found_page.dart';
import 'package:flutteristas/pages/privacy_page.dart';
import 'package:flutteristas/pages/welcome_page.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

final routes = <String, Route>{
  WelcomePage.path: WelcomePage.route,
  FlutteristasConferencePage.path: FlutteristasConferencePage.route,
  // FollowUsPage.path: FollowUsPage.route,
  // ContactUsPage.path': ContactUsPage.route,
  FlutteristasMapPage.path: FlutteristasMapPage.route,
  CodeOfConductPage.path: CodeOfConductPage.route,
  PrivacyPolicyPage.path: PrivacyPolicyPage.route,
};

class App extends StatefulComponent {
  const App({super.key});

  static DataFetcher dataFetcherOf(BuildContext context) {
    return context.findAncestorStateOfType<_AppState>()!.dataFetcher;
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final dataFetcher =
      DataFetcher(projectId: 'flutteristas-website-ffa6d-default-rtdb');

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Router(
      routes: [
        ShellRoute(
          routes: routes.values.toList(),
          builder: (BuildContext context, RouteState state, Component child) {
            return PageFrame(child: child);
          },
        ),
      ],
      errorBuilder: NotFoundPage.builder,
    );
  }
}
