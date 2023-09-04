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
    yield div(
      id: 'column-items-2-375-cols',
      [
        p([
          br(),
          Text('Greetings, Flutteristas! 💜'),
          br(),
          br(),
          text(
              'Mark your calendars because the highly anticipated Flutteristas Conference is just around the corner, set to take place on November 11th this year. We\'re thrilled to unveil the Call for Papers (CFP), now welcoming submissions until September 5th, 2023.'),
          br(),
          br(),
          Text(
              'But that\'s not all – we\'re extending an invitation for you to shine as a speaker at this remarkable event. Don\'t fret if you\'re new to public speaking, every journey has its starting point, and for us, that\'s ground zero. Allow us to be your foundation.'),
          // br(),
          // br(),
          // Text(
          //     'Here at Flutteristas, a vibrant community created for women and non-binary individuals, we believe in empowering each other. Your unique voice and perspective matter, and this conference is the perfect stage to share it.'),
          // br(),
          // br(),
          // Text(
          //     'Inclusivity lies at the heart of Flutteristas, and we strongly encourage persons of all backgrounds and abilities to apply. If you have a story to tell, knowledge to share, and are passionate about Flutter, we want to hear from you.'),
          // br(),
          // br(),
          // Text(
          //     'If you have specific needs to ensure your full participation, please mention this in the notes section of the application. Don\'t hesitate to reach out to us, we\'re dedicated to making this experience accessible and enriching for everyone.'),
          // br(),
          // br(),
          // Text(
          //   'Rest assured, the Flutteristas Community is brimming with seasoned speakers who are committed to guiding and bolstering you, ensuring your journey is nothing short of unforgettable. Together, we\'ll make Flutteristas Conference 2023 an experience to remember! 🚀🎤💫',
          // ),
          // br(),
          // br(),
          // p([
          //   text('If you are interested in presenting, you can submit your Call For Paper '),
          //   a(
          //     href: 'https://forms.gle/EwcchKz4tUbSaAqy8',
          //     target: Target.blank,
          //     [text('here')],
          //   ),
          //   text('.'),
          // ])
        ]),
        p([
          img(
            src: 'images/cfp_post.png',
            styles: Styles.box(
              width: Unit.percent(280),
            ),
          ),
        ]),
      ],
    );
    // yield br();
    // yield br();
    // yield Text(
    //     'But that\'s not all – we\'re extending an invitation for you to shine as a speaker at this remarkable event. Don\'t fret if you\'re new to public speaking; every journey has its starting point, and for us, that\'s ground zero. Allow us to be your foundation.');
    // yield br();
    // yield br();
    yield Text(
        'Here at Flutteristas, a vibrant community created for women and non-binary individuals, we believe in empowering each other. Your unique voice and perspective matter, and this conference is the perfect stage to share it.');
    yield br();
    yield br();
    yield Text(
        'Inclusivity lies at the heart of Flutteristas, and we strongly encourage persons of all backgrounds and abilities to apply. If you have a story to tell, knowledge to share, and are passionate about Flutter, we want to hear from you.');
    yield br();
    yield br();
    yield Text(
        'If you have specific needs to ensure your full participation, please mention this in the notes section of the application. Don\'t hesitate to reach out to us; we\'re dedicated to making this experience accessible and enriching for everyone.');
    yield br();
    yield br();
    yield Text(
      'Rest assured, the Flutteristas Community is brimming with seasoned speakers who are committed to guiding and bolstering you, ensuring your journey is nothing short of unforgettable. Together, we\'ll make Flutteristas Conference 2023 an experience to remember! 🚀🎤💫',
    );
    yield br();
    yield br();

    yield p([
      text('If you are interested in presenting, you can submit your Call For Paper '),
      a(
        href: 'https://forms.gle/EwcchKz4tUbSaAqy8',
        target: Target.blank,
        [text('here')],
      ),
      text('.'),
    ]);
  }
}
