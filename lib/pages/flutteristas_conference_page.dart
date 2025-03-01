import 'package:collection/collection.dart';
import 'package:flutteristas/pages/conference/agenda_talk_list.dart';
import 'package:flutteristas/pages/conference/organizers_list.dart';
import 'package:flutteristas/pages/conference/speakers_list.dart';
import 'package:flutteristas/pages/conference/sponsors_list.dart';
import 'package:flutteristas/utilities/extensions.dart';
import 'package:jaspr/ui.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:web/web.dart' hide Text;

class FlutteristasConferencePage extends StatefulComponent {
  const FlutteristasConferencePage({
    super.key,
    required this.conferenceYear,
  });

  final String conferenceYear;

  static final path = '/flutteristas-conference/2025';

  static final route = Route(
    path: '/flutteristas-conference/:conferenceYear',
    title: 'Flutteristas Conference',
    builder: (context, state) => FlutteristasConferencePage(conferenceYear: '2023'),
    //TODO VeraCheck::  can't seem to call pathParams here as noted under "Child Routes" here: https://docs.page/schultek/jaspr/components/router#child-routes
    //TODO VeraCheck:: using state.params['conferenceYear']! instead
    routes: [
      Route(
        path: ':conferenceYear',
        builder: (context, state) =>
            FlutteristasConferencePage(conferenceYear: state.params['conferenceYear']!),
      ),
    ],
  );

  @override
  State<FlutteristasConferencePage> createState() => _FlutteristasConferenceState();
}

class _FlutteristasConferenceState extends State<FlutteristasConferencePage> {
  late String _selectedYear;
  late Future<List<String>> _futureYears;

  final _currentYear = DateTime.now().year;

  @override
  void initState() {
    super.initState();
    _selectedYear = component.conferenceYear;
    _futureYears = fetchYears();
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
            _selectedYear == _currentYear.toString()
                ? p(classes: 'conference-coming-soon', [Text('Coming Soon!')])
                : span([]),
            h2(
                classes: 'conference-text',
                [Text('Flutteristas'), br(), Text('Conference $_selectedYear')]),
          ]),
          _selectedYear == _currentYear.toString()
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
                    href: 'https://www.meetup.com/flutterista/events/305942245/'
                        '?utm_medium=referral&utm_campaign=share-btn_savedevents_share_modal&utm_source=link',
                    [text('RSVP Now')],
                  )
                ])
              : span([])
        ]),
        div(classes: 'conference-container', [
          p([
            br(),
            Text('Greetings, Flutteristas! 💜'),
            br(),
            br(),
            text('Mark your calendars because the highly anticipated Flutteristas Conference '
                'is just around the corner, set to take place on 5th November this year. '),
            br(),
            br(),
          ]),
          div(classes: 'conference-tab', [
            button(id: 'default', type: ButtonType.button, classes: 'tab-link', [
              text('Agenda')
            ], events: {
              'click': (dynamic event) {
                // Get all elements with class="tabcontent" and hide them
                final tabcontent = document.getElementsByClassName('tab-content');
                for (int i = 0; i < tabcontent.length; i++) {
                  final item = tabcontent.item(i)! as HTMLElement;
                  item.style.display = 'none';
                }

                // Get all elements with class="tablinks" and remove the class "active"
                final tablinks = document.getElementsByClassName('tab-link');
                for (int i = 0; i < tablinks.length; i++) {
                  final item = tablinks.item(i)! as HTMLElement;
                  item.className = 'tab-link';
                }

                // Show the current tab, and add an "active" class to the button that opened the tab
                (document.getElementById('Agenda')! as HTMLElement).style.display = 'block';
                event.currentTarget.className += ' active';
              }
            }),
            button(id: 'default', type: ButtonType.button, classes: 'tab-link', [
              text('Speakers')
            ], events: {
              'click': (dynamic event) {
                // Get all elements with class="tabcontent" and hide them
                final tabcontent = document.getElementsByClassName('tab-content');
                for (int i = 0; i < tabcontent.length; i++) {
                  final item = tabcontent.item(i)! as HTMLElement;
                  item.style.display = 'none';
                }

                // Get all elements with class="tablinks" and remove the class "active"
                final tablinks = document.getElementsByClassName('tab-link');
                for (int i = 0; i < tablinks.length; i++) {
                  final item = tablinks.item(i)! as HTMLElement;
                  item.className = 'tab-link';
                }

                // Show the current tab, and add an "active" class to the button that opened the tab
                (document.getElementById('Speakers')! as HTMLElement).style.display = 'block';
                event.currentTarget.className += ' active';
              }
            }),
            button(type: ButtonType.button, classes: 'tab-link', [
              text('Sponsors')
            ], events: {
              'click': (dynamic event) {
                // Get all elements with class="tabcontent" and hide them
                final tabcontent = document.getElementsByClassName('tab-content');
                for (int i = 0; i < tabcontent.length; i++) {
                  final item = tabcontent.item(i)! as HTMLElement;
                  item.style.display = 'none';
                }

                // Get all elements with class="tablinks" and remove the class "active"
                final tablinks = document.getElementsByClassName('tab-link');
                for (int i = 0; i < tablinks.length; i++) {
                  final item = tablinks.item(i)! as HTMLElement;
                  item.className = 'tab-link';
                }

                // Show the current tab, and add an "active" class to the button that opened the tab
                (document.getElementById('Sponsors')! as HTMLElement).style.display = 'block';
                event.currentTarget.className += ' active';
              }
            }),
            button(type: ButtonType.button, classes: 'tab-link', [
              text('Organizers')
            ], events: {
              'click': (dynamic event) {
                // Get all elements with class="tabcontent" and hide them
                final tabcontent = document.getElementsByClassName('tab-content');
                for (int i = 0; i < tabcontent.length; i++) {
                  final item = tabcontent.item(i)! as HTMLElement;
                  item.style.display = 'none';
                }

                // Get all elements with class="tablinks" and remove the class "active"
                final tablinks = document.getElementsByClassName('tab-link');
                for (int i = 0; i < tablinks.length; i++) {
                  final item = tablinks.item(i)! as HTMLElement;
                  item.className = 'tab-link';
                }

                // Show the current tab, and add an "active" class to the button that opened the tab
                (document.getElementById('Organizers')! as HTMLElement).style.display = 'block';
                event.currentTarget.className += ' active';
              }
            })
            // button(type: ButtonType.button, classes: [
            //   'tab-link'
            // ], [
            //   text('Code Challenge')
            // ], events: {
            //   'click': (dynamic event) {
            //     var i, tabcontent, tablinks;
            //     // Get all elements with class="tabcontent" and hide them
            //     tabcontent = document.getElementsByClassName("tab-content");
            //     for (i = 0; i < tabcontent.length; i++) {
            //       tabcontent[i].style.display = "none";
            //     }
            //     // Get all elements with class="tablinks" and remove the class "active"
            //     tablinks = document.getElementsByClassName("tab-link");
            //     for (i = 0; i < tablinks.length; i++) {
            //       tablinks[i].className = "tab-link";
            //     }
            //     // Show the current tab, and add an "active" class to the button that opened the tab
            //     document.getElementById('challenge')?.style.display = "block";
            //     event.currentTarget.className += " active";
            //   }
            // })
          ]),
          div(id: 'Agenda', classes: 'tab-content', [
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
          div(id: 'Speakers', classes: 'tab-content', [
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
          div(id: 'Sponsors', classes: 'tab-content', [
            div(classes: 'sponsors-section', [
              Spacer(height: Unit.pixels(50)),
              h2([Text('Sponsors')]),
              div(id: 'sponsors', classes: 'sponsors-container', [
                h3(classes: 'sponsors-gold', [text('Gold')]),
                SponsorsList(
                  key: Key(_selectedYear),
                  category: 'gold_sponsorship',
                  conferenceYear: _selectedYear,
                ),
                h3(classes: 'sponsors-silver', [text('Silver')]),
                SponsorsList(
                  key: Key(_selectedYear),
                  category: 'silver_sponsorship',
                  conferenceYear: _selectedYear,
                ),
                // h3(classes: 'sponsors-bronze', [text('Bronze')]),
              ]),
            ])
          ]),
          div(id: 'Organizers', classes: 'tab-content', [
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
          // div(id: 'challenge', classes: 'tab-content', [
          //   div(classes: 'challenge-section', [
          //     div(classes: 'challenge-container', [
          //       div(id: 'code-challenge', [
          //         Spacer(height: Unit.pixels(50)),
          //         h2([Text('Flutterista Generate - Code Challenge')]),
          //         div(classes: 'code-challenge-container', [CodeChallenge()]),
          //       ])
          //     ])
          //   ])
          // ])
        ])
      ])
    ]);
    // }
  }
}
