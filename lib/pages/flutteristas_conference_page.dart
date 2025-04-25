import 'dart:async';
import 'dart:js_interop';

import 'package:collection/collection.dart';
import 'package:flutteristas/pages/conference/agenda_talk_list.dart';
import 'package:flutteristas/pages/conference/organizers_list.dart';
import 'package:flutteristas/pages/conference/speakers_list.dart';
import 'package:flutteristas/pages/conference/sponsors_list.dart';
import 'package:flutteristas/pages/code_challenge_page.dart';
import 'package:flutteristas/utilities/extensions.dart';
import 'package:jaspr/ui.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:web/web.dart' hide Text;

class FlutteristasConferencePage extends StatefulComponent {
  const FlutteristasConferencePage({
    super.key,
    required this.conferenceYear,
    required this.conferenceDate,
  });

  final String conferenceYear;
  final String conferenceDate;

  static final path = '/flutteristas-conference';

  static final route = Route(
    path: '/flutteristas-conference',
    title: 'Flutteristas Conference',
    builder: (context, state) {
      return FlutteristasConferencePage(conferenceYear: '2025', conferenceDate: '5th April');
    },
    routes: [
      Route(
        path: ':conferenceYear',
        title: 'Flutteristas Conference',
        builder: (context, state) {
          final conferenceYear = state.params['conferenceYear']!;
          final conferenceDate =
              state.params['conferenceYear']! == '2025' ? '5th April' : '11th November';
          return FlutteristasConferencePage(
              conferenceYear: conferenceYear, conferenceDate: conferenceDate);
        },
      ),
    ],
  );

  @override
  State<FlutteristasConferencePage> createState() => _FlutteristasConferenceState();
}

class _FlutteristasConferenceState extends State<FlutteristasConferencePage> {
  late String _selectedYear;
  late Future<List<String>> _futureYears;

  final _currentYear = DateTime.now().year.toString();

  @override
  void initState() {
    super.initState();
    _selectedYear = component.conferenceYear;
    _futureYears = fetchYears();

    final pageUrl = Uri.parse(document.location!.href);
    final defaultTab = pageUrl.hasFragment ? pageUrl.fragment : 'agenda';
    scheduleMicrotask(() => _selectDefaultTab(defaultTab));
  }

  Future<List<String>> fetchYears() async {
    return await context.dataFetcher.fetchData(
      '/speakers/conference_year',
      shallow: true,
      fromJson: (data) {
        return ((data as Map?) ?? {}) //
            .cast<String, dynamic>()
            .keys
            .sorted((a, b) => b.compareTo(a));
      },
    );
  }

  void _selectDefaultTab(String name) {
    final button = (document.getElementById('tab-button-$name')! as HTMLElement);
    button.className = 'active';
    final content = (document.getElementById('tab-content-$name')! as HTMLElement);
    content.style.display = 'block';
  }

  void _onTabPressed(Event event) {
    final target = (event.currentTarget as HTMLElement);
    final id = target.dataset['id'];

    // Update URL to reflect current tab
    window.history.replaceState({}.toJSBox, '', '/flutteristas-conference/$_selectedYear#$id');

    // Get all conference tabs and set the selected one as active
    final tabs = document.getElementById('conference-tabs')!.children;
    for (int i = 0; i < tabs.length; i++) {
      final item = tabs.item(i)! as HTMLElement;
      item.className = (item == target ? 'active' : '');
    }

    // Get all conference tab contents and set the selected one as visible
    final activeContent = document.getElementById('tab-content-$id');
    final tabContent = document.getElementById('conference-tab-content')!.children;
    for (int i = 0; i < tabContent.length; i++) {
      final item = tabContent.item(i)! as HTMLElement;
      item.style.display = item == activeContent ? 'block' : 'none';
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'conference-sidebar', [
      h3([Text('Year:')]),
      // ToDo: fetch years list here, just be sure to keep the same classes
      ul(classes: 'years-list', [
        FutureBuilder<List<String>>(
          initialData: <String>[],
          future: _futureYears,
          builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) sync* {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData == false) {
                yield div([
                  p([text('Archive not found ...')])
                ]);
              } else {
                for (final item in snapshot.requireData) {
                  yield li(
                    classes: 'year-item',
                    [
                      a(
                        href: '/flutteristas-conference/$item',
                        events: {
                          'click': (Event event) {
                            event.preventDefault();
                            context.replace('/flutteristas-conference/$item');
                            setState(() => _selectedYear = item);
                          },
                        },
                        classes: 'year-link',
                        [text('Conference $item')],
                      ),
                    ],
                  );
                }
              }
            }
          },
        ),
      ])
    ]);
    yield Spacer(height: Unit.pixels(10));
    yield div(classes: 'conference-wrapper', [
      div(classes: 'conference-main', [
        div(classes: 'conference-hero', [
          div(classes: 'conference-title', [
            // _selectedYear == _currentYear
            //     ? p(classes: 'conference-coming-soon', [Text('Coming Soon!')])
            //     : span([]),
            h2(
                classes: 'conference-text',
                [Text('Flutteristas'), br(), Text('Conference $_selectedYear')]),
          ]),
          _selectedYear == _currentYear
              ? div(classes: 'conference-details', [
                  p([
                    img(
                      src: '/images/calendar_month_FILL0_wght400_GRAD0_opsz24.svg',
                      alt: 'date-icon',
                    ),
                    Text('Date: 5 April 2025 ')
                  ]),
                  p([
                    img(
                      src: '/images/location_on_FILL0_wght400_GRAD0_opsz24.svg',
                      alt: 'location-icon',
                    ),
                    Text('Location: '),
                    a(
                      [Text('Youtube Live Stream')],
                      href: 'https://www.youtube.com/watch?v=ftTXXAx8AxM',
                    ),
                    a(
                      [
                        img(src: '/images/external-link-svgrepo-com.svg', alt: 'external-link-icon')
                      ],
                      target: Target.blank,
                      href: 'https://www.youtube.com/watch?v=ftTXXAx8AxM',
                    )
                  ]),
                  p([
                    img(src: '/images/tag_FILL0_wght400_GRAD0_opsz24.svg', alt: 'hash-tag-icon'),
                    Text('FlutteristasConf2025 - '),
                    a(
                      [
                        img(
                          classes: 'social-icon',
                          src: '/images/x-logo-conf.svg',
                          alt: 'twitter-icon',
                        )
                      ],
                      target: Target.blank,
                      href: 'https://twitter.com/FlutteristasCon',
                    ),
                    a(
                      [
                        img(
                          classes: 'social-icon',
                          src: '/images/Mastodon-conf.svg',
                          alt: 'mastodon-icon',
                        )
                      ],
                      target: Target.blank,
                      href: 'https://fluttercommunity.social/@FlutteristasCon',
                    ),
                    a(
                      [
                        img(
                          classes: 'social-icon',
                          src: '/images/bluesky-icon-conf.svg',
                          alt: 'facebook-icon',
                        )
                      ],
                      target: Target.blank,
                      href: 'https://bsky.app/profile/flutteristascon.flutter.community',
                    )
                  ]),
                  a(
                      classes: 'hero-button',
                      target: Target.blank,
                      href: 'https://www.youtube.com/watch?v=ftTXXAx8AxM',
                      [text('In case you missed it...')]),
                ])
              : span([])
        ]),
        div(classes: 'conference-container', [
          p([
            br(),
            Text('Greetings, Flutteristas! 💜'),
            br(),
            br(),
            // _selectedYear == _currentYear
            //     ? text('Mark your calendars because the highly anticipated Flutteristas Conference '
            //         'is just around the corner, set to take place on '
            //         '${component.conferenceDate} this year. ')
            //     :
            text('The conference took place on '
                    '${component.conferenceDate} ${component.conferenceYear}, '
                    'you can still find all the details below.'),
            br(),
            br(),
          ]),
          div(id: 'conference-tabs', [
            button(
              id: 'tab-button-agenda',
              attributes: {'data-id': 'agenda'},
              events: {'click': _onTabPressed},
              [text('Agenda')],
            ),
            button(
              id: 'tab-button-speakers',
              attributes: {'data-id': 'speakers'},
              events: {'click': _onTabPressed},
              [text('Speakers')],
            ),
            button(
              id: 'tab-button-sponsors',
              attributes: {'data-id': 'sponsors'},
              events: {'click': _onTabPressed},
              [text('Sponsors')],
            ),
            button(
              id: 'tab-button-organizers',
              attributes: {'data-id': 'organizers'},
              events: {'click': _onTabPressed},
              [text('Organizers')],
            ),
            button(
              attributes: {'data-id': 'challenge'},
              events: {'click': _onTabPressed},
              [text('Code Challenge')],
            ),
          ]),
          div(id: 'conference-tab-content', [
            div(id: 'tab-content-agenda', [
              div(classes: 'agenda-section', [
                Spacer(height: Unit.pixels(50)),
                h2([Text('Agenda')]),
                div(classes: 'agenda-container', [
                  AgendaTalkList(
                    key: Key(_selectedYear),
                    conferenceYear: _selectedYear,
                  )
                ])
              ])
            ]),
            div(id: 'tab-content-speakers', [
              div(classes: 'speakers-section', [
                Spacer(height: Unit.pixels(50)),
                h2([Text('Speakers')]),
                div(classes: 'speakers-container', [
                  SpeakersList(
                    key: Key(_selectedYear),
                    conferenceYear: _selectedYear,
                  )
                ])
              ])
            ]),
            div(id: 'tab-content-sponsors', [
              div(classes: 'sponsors-section', [
                Spacer(height: Unit.pixels(50)),
                h2([Text('Sponsors')]),
                div(id: 'sponsors', classes: 'sponsors-container', [
                  h3(classes: 'sponsors-gold', [text('Gold')]),
                  SponsorsList(
                    key: Key(_selectedYear),
                    columnCount: 3,
                    category: 'gold_sponsorship',
                    conferenceYear: _selectedYear,
                  ),
                ]),
                div(id: 'sponsors', classes: 'sponsors-container', [
                  h3(classes: 'sponsors-silver', [text('Silver')]),
                  SponsorsList(
                    key: Key(_selectedYear),
                    columnCount: 4,
                    category: 'silver_sponsorship',
                    conferenceYear: _selectedYear,
                  ),
                  // h3(classes: 'sponsors-bronze', [text('Bronze')]),
                ]),
              ])
            ]),
            div(id: 'tab-content-organizers', [
              Spacer(height: Unit.pixels(50)),
              div(classes: 'organizers-section', [
                h2([Text('Organizers')]),
                div(classes: 'organizers-container', [
                  OrganizersList(
                    key: Key(_selectedYear),
                    conferenceYear: _selectedYear,
                  )
                ])
              ])
            ]),
            div(id: 'tab-content-challenge', [
              div(classes: 'challenge-section', [
                div(classes: 'challenge-container', [
                  div(id: 'code-challenge', [
                    Spacer(height: Unit.pixels(50)),
                    h2([Text('Flutterista - Code Challenge')]),
                    CodeChallenge(conferenceYear: _selectedYear),
                  ])
                ])
              ])
            ]),
          ]),
        ])
      ])
    ]);
    // }
  }
}
