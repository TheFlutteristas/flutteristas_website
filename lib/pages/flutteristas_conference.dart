// import 'package:flutteristas/pages/agenda_page.dart';
import 'dart:html';
import 'package:flutteristas/pages/agenda_page.dart';
import 'package:flutteristas/pages/code_challenge_page.dart';
import 'package:flutteristas/pages/organizers_page.dart';
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
          img(
              src: '/images/calendar_month_FILL0_wght400_GRAD0_opsz24.svg',
              alt: 'date-icon'),
          Text('Date: 11 November 2023 ')
        ]),
        p([
          img(
              src: '/images/location_on_FILL0_wght400_GRAD0_opsz24.svg',
              alt: 'location-icon'),
          Text('Location: '),
          a([Text('Live Stream on YouTube')],
              target: Target.blank,
              href: 'https://www.youtube.com/watch?v=9UAOMzl7Nuo'),
          a([
            img(
                src: '/images/external-link-svgrepo-com.svg',
                alt: 'external-link-icon')
          ],
              target: Target.blank,
              href: ' https://www.youtube.com/watch?v=9UAOMzl7Nuo')
        ]),
        p([
          img(
              src: '/images/tag_FILL0_wght400_GRAD0_opsz24.svg',
              alt: 'hash-tag-icon'),
          Text('FlutteristasConf2023 - '),
          a([
            img(
                classes: ['social-icon'],
                src: '/images/x-logo-conf.svg',
                alt: 'twitter-icon')
          ], target: Target.blank, href: 'https://twitter.com/FlutteristasCon'),
          a([
            img(
                classes: ['social-icon'],
                src: '/images/Mastodon-conf.svg',
                alt: 'mastodon-icon')
          ],
              target: Target.blank,
              href: 'https://fluttercommunity.social/@FlutteristasCon'),
        ]),
        a(
            classes: ['hero-button'],
            target: Target.blank,
            href: 'https://www.meetup.com/flutterista/events/297091400/',
            [text('RSVP Now')])
      ]),
    ]);
    yield div(classes: [
      'conference-container'
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
      ),
      div(classes: [
        'conference-tab',
      ], [
        button(id: 'default', type: ButtonType.button, classes: [
          'tab-link'
        ], [
          text('Agenda')
        ], events: {
          'click': (dynamic event) {
            var i, tabcontent, tablinks;

            // Get all elements with class="tabcontent" and hide them
            tabcontent = document.getElementsByClassName("tab-content");
            for (i = 0; i < tabcontent.length; i++) {
              tabcontent[i].style.display = "none";
            }

            // Get all elements with class="tablinks" and remove the class "active"
            tablinks = document.getElementsByClassName("tab-link");
            for (i = 0; i < tablinks.length; i++) {
              tablinks[i].className = "tab-link";
            }

            // Show the current tab, and add an "active" class to the button that opened the tab
            document.getElementById('Agenda')?.style.display = "block";
            event.currentTarget.className += " active";
          }
        }),
        button(id: 'default', type: ButtonType.button, classes: [
          'tab-link'
        ], [
          text('Speakers')
        ], events: {
          'click': (dynamic event) {
            var i, tabcontent, tablinks;

            // Get all elements with class="tabcontent" and hide them
            tabcontent = document.getElementsByClassName("tab-content");
            for (i = 0; i < tabcontent.length; i++) {
              tabcontent[i].style.display = "none";
            }

            // Get all elements with class="tablinks" and remove the class "active"
            tablinks = document.getElementsByClassName("tab-link");
            for (i = 0; i < tablinks.length; i++) {
              tablinks[i].className = "tab-link";
            }

            // Show the current tab, and add an "active" class to the button that opened the tab
            document.getElementById('Speakers')?.style.display = "block";
            event.currentTarget.className += " active";
          }
        }),
        button(type: ButtonType.button, classes: [
          'tab-link'
        ], [
          text('Sponsors')
        ], events: {
          'click': (dynamic event) {
            var i, tabcontent, tablinks;

            // Get all elements with class="tabcontent" and hide them
            tabcontent = document.getElementsByClassName("tab-content");
            for (i = 0; i < tabcontent.length; i++) {
              tabcontent[i].style.display = "none";
            }

            // Get all elements with class="tablinks" and remove the class "active"
            tablinks = document.getElementsByClassName("tab-link");
            for (i = 0; i < tablinks.length; i++) {
              tablinks[i].className = "tab-link";
            }

            // Show the current tab, and add an "active" class to the button that opened the tab
            document.getElementById('Sponsors')?.style.display = "block";
            event.currentTarget.className += " active";
          }
        }),
        button(type: ButtonType.button, classes: [
          'tab-link'
        ], [
          text('Organizers')
        ], events: {
          'click': (dynamic event) {
            var i, tabcontent, tablinks;

            // Get all elements with class="tabcontent" and hide them
            tabcontent = document.getElementsByClassName("tab-content");
            for (i = 0; i < tabcontent.length; i++) {
              tabcontent[i].style.display = "none";
            }

            // Get all elements with class="tablinks" and remove the class "active"
            tablinks = document.getElementsByClassName("tab-link");
            for (i = 0; i < tablinks.length; i++) {
              tablinks[i].className = "tab-link";
            }

            // Show the current tab, and add an "active" class to the button that opened the tab
            document.getElementById('Organizers')?.style.display = "block";
            event.currentTarget.className += " active";
          }
        }),
        button(type: ButtonType.button, classes: [
          'tab-link'
        ], [
          text('Code Challenge')
        ], events: {
          'click': (dynamic event) {
            var i, tabcontent, tablinks;

            // Get all elements with class="tabcontent" and hide them
            tabcontent = document.getElementsByClassName("tab-content");
            for (i = 0; i < tabcontent.length; i++) {
              tabcontent[i].style.display = "none";
            }

            // Get all elements with class="tablinks" and remove the class "active"
            tablinks = document.getElementsByClassName("tab-link");
            for (i = 0; i < tablinks.length; i++) {
              tablinks[i].className = "tab-link";
            }

            // Show the current tab, and add an "active" class to the button that opened the tab
            document.getElementById('challenge')?.style.display = "block";
            event.currentTarget.className += " active";
          }
        })
      ]),
      div(id: 'Agenda', classes: [
        'tab-content'
      ], [
        div(classes: [
          'agenda-section'
        ], [
          Spacer(height: Unit.pixels(50)),
          h2([Text('Agenda')]),
          div(classes: [
            'agenda-container'
          ], [
            AgendaTalkList(
              projectId: 'flutteristas-website-ffa6d-default-rtdb',
            )
          ])
        ])
      ]),
      div(id: 'Speakers', classes: [
        'tab-content'
      ], [
        div(classes: [
          'speakers-section'
        ], [
          Spacer(height: Unit.pixels(50)),
          h2([Text('Speakers')]),
          div(classes: [
            'speakers-container'
          ], [
            SpeakersList(
              projectId: 'flutteristas-website-ffa6d-default-rtdb',
            )
          ])
        ])
      ]),
      div(id: 'Sponsors', classes: [
        'tab-content'
      ], [
        div(classes: [
          'sponsors-section'
        ], [
          Spacer(height: Unit.pixels(50)),
          h2([Text('Sponsors')]),
          div(id: 'sponsors', classes: [
            'sponsors-container'
          ], [
            h3(classes: ['sponsors-gold'], [text('Gold')]),
            SponsorsList(
                projectId: 'flutteristas-website-ffa6d-default-rtdb',
                category: 'gold_sponsorship'),
            h3(classes: ['sponsors-silver'], [text('Silver')]),
            SponsorsList(
                projectId: 'flutteristas-website-ffa6d-default-rtdb',
                category: 'silver_sponsorship'),
            // h3(classes: ['sponsors-bronze'], [text('Bronze')]),
          ]),
        ])
      ]),
      div(id: 'Organizers', classes: [
        'tab-content'
      ], [
        Spacer(height: Unit.pixels(50)),
        div(classes: [
          'organizers-section'
        ], [
          h2([Text('Organizers')]),
          div(classes: [
            'organizers-container'
          ], [
            OrganizersList(
              projectId: 'flutteristas-website-ffa6d-default-rtdb',
            )
          ])
        ])
      ]),
      div(id: 'challenge', classes: [
        'tab-content'
      ], [
        div(classes: [
          'challenge-section'
        ], [
          div(classes: [
            'challenge-container'
          ], [
            div(id: 'code-challenge', [
              Spacer(height: Unit.pixels(50)),
              h2([Text('Flutterista Generate - Code Challenge')]),
              div(classes: ['code-challenge-container'], [CodeChallenge()]),
            ])
          ])
        ])
      ])
    ]);
  }
}
