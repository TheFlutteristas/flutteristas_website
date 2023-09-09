import 'dart:html';

import 'package:jaspr/components.dart';
import 'package:jaspr/html.dart';
import 'package:jaspr_router/jaspr_router.dart';

class FlutteristasConferencePage extends StatelessComponent {
  const FlutteristasConferencePage({super.key});

  static final route = Route(
    path: '/flutteristas-conference',
    title: 'Flutteristas Conference',
    builder: (context, state) => FlutteristasConferencePage(),
  );

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Text(
      'Flutteristas 2023 Conference - 11 November - Live Stream on YouTube',
    );
    yield br();
    yield br();
    yield p(
      [
        br(),
        Text('Greetings, Flutteristas! 💜'),
        br(),
        br(),
        text('Mark your calendars because the highly anticipated Flutteristas Conference is just around the corner, '
            'set to take place on November 11th this year. '),
        br(),
        br(),
      ],
    );
  }
}
