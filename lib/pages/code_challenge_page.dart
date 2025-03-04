import 'package:jaspr/jaspr.dart';

class CodeChallenge extends StatelessComponent {
  const CodeChallenge({
    super.key,
    required this.conferenceYear,
  });

  final String conferenceYear;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    print ('conferenceYear: $conferenceYear');
    yield div(classes: 'code-challenge-container',
    [
      if (conferenceYear == '2023') ...challenge2023(context),
      if (conferenceYear == '2025') ...challenge2025(context),
    ]);
  }

  Iterable<Component> challenge2023(BuildContext context) sync* {
    yield div([
        p([
          text(
            'Join us for our code challenge, Flutterista Generate, and flex your creative skills! '
            'Use Flutter and Dart to generate an artistic digital masterpiece. It can be a cool '
            'background, repeating pattern, or anything you want (just make sure it can run in '
            'DartPad). For inspiration check out some of ',
          ),
          a(
            href: 'https://www.youtube.com/watch?v=DEppSs_ko48',
            target: Target.blank,
            [text('Robert Felker\'s Flutter art')],
          ),
          text('.'),
        ]),
        p([
          text(
              'The winning entry will be selected based on creativity, aesthetics, code '
              'organization, code quality, and overall execution. Find submission guidelines '
              'and the entry form at the link below.'),
        ]),
        p([
          text('Submissions are due by 10 November at 3:00AM GMT.'),
        ]),
        p([
          a(
            classes: 'hero-button',
            href: 'https://docs.google.com/forms'
                '/d/e/1FAIpQLSe5pS0_1_lKhskyIQHFgpq2gxNlkSguRn5jPdN7HSVaa3JD_A/viewform',
            target: Target.blank,
            [text('Get started!')],
          ),
        ])
      ,
    ]);
    yield div(classes: 'code-challenge-image', [
            div(classes: 'code-challenge-sponsor', [
              span([text('Brought to you by ')]),
              a(
                href: 'https://invertase.io/',
                target: Target.blank,
                [
                  img(
                      classes: 'sponsor-logo',
                      src: '/images/invertase_logo.png',
                      alt: 'sponsor-logo')
                ],
              ),
            ]),
            img(src: '/images/code_challenge_art.jpg', alt: 'banner-image'),
          ]);
  }

  Iterable<Component> challenge2025(BuildContext context) sync* {
    yield div([
      div([
        p(styles: Styles(color: Color.hex('#66209B'),fontSize: Unit.pixels(32), fontWeight: FontWeight.bold), 
        [
          text(
            'Coming Soon!',
          ),
        ])
      ]),
    ]);
  }
}
