// import 'package:flutteristas/pages/agenda_page.dart';
import 'package:flutteristas/pages/speakers_page.dart';
import 'package:flutteristas/pages/sponsors_page.dart';
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
    yield div(classes: [
      'conference-hero'
    ], [
      div(classes: [
        'conference-title'
      ], [
        h2(classes: ['conference-text'], [Text('Flutteristas')]),
        h2(classes: ['conference-text'], [Text('2023 Conference')])
      ]),
      div(classes: [
        'conference-details'
      ], [
        p([
          img(src: '/images/calendar_month_FILL0_wght400_GRAD0_opsz24.svg'),
          Text('Date: 11 November 2023 ')
        ]),
        p([
          img(src: '/images/location_on_FILL0_wght400_GRAD0_opsz24.svg'),
          Text('Location: Live Stream on YouTube')
        ]),
        p([
          img(src: '/images/tag_FILL0_wght400_GRAD0_opsz24.svg'),
          Text('FlutteristasConf2023')
        ])
      ]),
    ]);
    yield div(classes: [
      'conference-description'
    ], [
      div(classes: [
        'description'
      ], [
        p(
          [
            br(),
            Text('Greetings, Flutteristas! 💜'),
            br(),
            br(),
            text(
                'Mark your calendars because the highly anticipated Flutteristas Conference is just around the corner, '
                'set to take place on November 11th this year. '),
            br(),
            br(),
          ],
        )
      ]),
      div(classes: [
        'quick-links'
      ], [
        h4([text('Quick links:')]),
        a(href: '#speakers', [
          p([text('Speakers')])
        ]),
        a(href: '#sponsors', [
          p([text('Sponsors')])
        ])
      ])
    ]);

    yield div(id: 'speakers', classes: [
      'speakers-section'
    ], [
      Spacer(height: Unit.pixels(50)),
      h2([Text('Speakers')]),
      div(classes: [
        'speakers-container'
      ], [
        SpeakersList(
          // projectId: 'flutteristas-website-ffa6d-default-rtdb',
          projectId: 'flutteristas-website-dev-default-rtdb',
        )
      ]),
      Spacer(height: Unit.pixels(50)),
      h2([Text('Sponsors')]),
      div(id: 'sponsors', classes: [
        'sponsors-container'
      ], [
        h3(classes: ['sponsors-gold'], [text('Gold')]),
        SponsorsList(
            projectId: 'flutteristas-website-dev-default-rtdb',
            category: 'gold_sponsorship'),
        h3(classes: ['sponsors-silver'], [text('Silver')]),
        SponsorsList(
            projectId: 'flutteristas-website-dev-default-rtdb',
            category: 'silver_sponsorship'),
        // h3(classes: ['sponsors-bronze'], [text('Bronze')]),
      ]),
    ]);

    // yield AgendaTalkList(
    //   projectId: 'flutteristas-website-dev-default-rtdb',
    // );

    // yield SpeakersList(
    //   projectId: 'flutteristas-website-dev-default-rtdb',
    // );
  }
}
