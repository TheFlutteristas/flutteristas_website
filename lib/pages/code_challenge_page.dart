import 'package:jaspr/html.dart';

class CodeChallenge extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      p([
        text(
          'Join us for our code challenge, Flutterista Generate, and flex your creative skills! '
          'Use Flutter and Dart to generate an artistic digital masterpiece. It can be a cool background, '
          'repeating pattern, or anything you want (just make sure it can run in DartPad). For inspiration '
          'check out some of ',
        ),
        a(
          href: 'https://www.youtube.com/watch?v=DEppSs_ko48',
          target: Target.blank,
          [text('Robert Felker\'s Flutter art')],
        ),
        text('.'),
      ]),
      p([
        text('The winning entry will be selected based on creativity, aesthetics, code organization, code quality, '
            'and overall execution. Find submission guidelines and the entry form at the link below.'),
      ]),
      p([
        text('Submissions are due by 10 November at 3:00AM GMT.'),
      ]),
      p([
        a(
          classes: ['hero-button'],
          href: 'https://docs.google.com/forms/d/e/1FAIpQLSe5pS0_1_lKhskyIQHFgpq2gxNlkSguRn5jPdN7HSVaa3JD_A/viewform',
          target: Target.blank,
          [text('Get started!')],
        ),
      ])
    ]);
    yield div(classes: [
      'code-challenge-image'
    ], [
      div(classes: [
        'code-challenge-sponsor'
      ], [
        span([text('Brought to you by ')]),
        a(href: 'https://invertase.io/', target: Target.blank, [
          img(
            classes: ['sponsor-logo'],
            src: '/images/invertase_logo.png',
          )
        ]),
      ]),
      img(src: '/images/code_challenge_art.jpg'),
    ]);
  }
}
