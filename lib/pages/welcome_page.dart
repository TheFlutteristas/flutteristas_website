import 'package:flutteristas/pages/code_of_conduct_page.dart';
import 'package:jaspr/ui.dart';
import 'package:jaspr_router/jaspr_router.dart';

class WelcomePage extends StatelessComponent {
  const WelcomePage({super.key});

  static final path = '/';

  static final route = Route(
    path: '/',
    title: 'Home',
    builder: (context, state) => WelcomePage(),
  );

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'conference-hero', [
      div(classes: 'conference-title', [
        p(classes: 'conference-coming-soon', [Text('Coming Soon!')]),
        h2(classes: 'conference-text', [Text('Flutteristas'), br(), Text('Conference 2025')]),
      ]),
      div(classes: 'conference-details', [
        p([
          img(src: '/images/calendar_month_FILL0_wght400_GRAD0_opsz24.svg', alt: 'date-icon'),
          Text('Date: 5 April 2025 ')
        ]),
        p([
          img(src: '/images/location_on_FILL0_wght400_GRAD0_opsz24.svg', alt: 'location-icon'),
          Text('Location: '),
          a([Text('Youtube Live Stream')], href: 'https://www.youtube.com/watch?v=ftTXXAx8AxM'),
          a([img(src: '/images/external-link-svgrepo-com.svg', alt: 'external-link-icon')],
              target: Target.blank, href: 'https://www.youtube.com/watch?v=ftTXXAx8AxM')
        ]),
        p([
          img(src: '/images/tag_FILL0_wght400_GRAD0_opsz24.svg', alt: 'hash-tag-icon'),
          Text('FlutteristasConf2025 - '),
          a([img(classes: 'social-icon', src: '/images/x-logo-conf.svg', alt: 'twitter-icon')],
              target: Target.blank, href: 'https://twitter.com/FlutteristasCon'),
          a([img(classes: 'social-icon', src: '/images/Mastodon-conf.svg', alt: 'mastodon-icon')],
              target: Target.blank, href: 'https://fluttercommunity.social/@FlutteristasCon'),
          a([
            img(classes: 'social-icon', src: '/images/bluesky-icon-conf.svg', alt: 'facebook-icon')
          ],
              target: Target.blank,
              href: 'https://bsky.app/profile/flutteristascon.flutter.community')
        ]),
        a(
            classes: 'hero-button',
            target: Target.blank,
            href: 'https://www.meetup.com/flutterista/events/305942245'
                '/?utm_medium=referral&utm_campaign=share-btn_savedevents_share_modal&utm_source=link',
            [text('RSVP Now')])
      ]),
    ]);
    yield div(classes: 'product-layout hero-section', [
      div([
        // Text(
        //   'Thanks for stopping by! 💙💜',
        // ),
        // yield Text(
        //   '',
        // );

        h2(
          [
            text('Who we are?'),
          ],
        ),
        p(
          classes: 'hero-text',
          [
            Text(
              'The Flutteristas is a world-wide community of women and non-binary and '
              'have an interest in the Flutter SDK.💙💜',
            ),
          ],
        ),
        a(
          classes: 'hero-button',
          href: '#join-layout',
          target: Target.self,
          [text('Apply now')],
        )
      ]),
      div([
        img(
          src: '/images/FlutterInteract-2019.jpg',
          alt: 'flutteristas-image',
          styles: Styles(
            width: Unit.percent(100),
            radius: BorderRadius.circular(Unit.pixels(14.0)),
          ),
        )
      ])
    ]);
    yield Spacer(height: Unit.pixels(100));
    yield h2(
      [
        text('Why join?'),
      ],
    );
    yield div(classes: 'activities-section', [
      div(classes: 'activities-item', [
        img(classes: 'activities-icon', src: '/images/4857010.png', alt: 'activities-icon'),
        h3([text('Meetings')]),
        p(
            classes: 'activities-text',
            [text('Monthly meetings to connect and share news and achievements')])
      ]),
      div(classes: 'activities-item', [
        img(classes: 'activities-icon', src: '/images/6491438.png', alt: 'activities-icon'),
        h3([text('Meet the Flutter Team')]),
        p(classes: 'activities-text', [
          text(
              'Guests from Google\'s Flutter team come and meet with us occasionally to share news, tips and answer questions.')
        ])
      ]),
      div(classes: 'activities-item', [
        img(classes: 'activities-icon', src: '/images/4892807.png', alt: 'activities-icon'),
        h3([text('Volunteering & Experiences')]),
        p(classes: 'activities-text', [
          text(
              'Flutteristas volunteer their time and talents in producing outstanding Flutterista conference experiences that reflect our members\' core competencies.')
        ])
      ]),
      div(classes: 'activities-item', [
        img(classes: 'activities-icon', src: '/images/7037084.png', alt: 'activities-icon'),
        h3([text('Speaker\'s training')]),
        p(classes: 'activities-text', [
          text(
              'Part of the conference experience is training conducted for the speakers by professionals to let them shine in their talk and gain attention.')
        ])
      ]),
    ]);
    yield Spacer(height: Unit.pixels(100));
    yield h2(
      [
        text('How to join?'),
      ],
    );
    //yield br();
    yield div(id: 'join-layout', classes: 'join-layout product-layout', [
      div([
        div(classes: 'product-layout join-item', [
          div([
            img(
                src: '/images/number-1-svgrepo-com.svg',
                styles: Styles(
                  width: Unit.pixels(100),
                ),
                alt: 'number-1-image')
          ]),
          div([
            p([
              text(
                'Do you identify as a woman or non-binary who has an interest in the Flutter SDK?',
              )
            ]),
          ])
        ]),
        div(classes: 'product-layout join-item', [
          div([
            img(
                classes: 'arrow-1',
                src: '/images/Arrow15.png',
                styles: Styles(
                  height: Unit.pixels(100),
                ),
                alt: 'arrow-image')
          ]),
          div([
            img(
                src: '/images/number-2-svgrepo-com.svg',
                styles: Styles(
                  width: Unit.pixels(100),
                ),
                alt: 'number-2-image')
          ]),
          div([
            p([
              text(
                'Do you have an interest in the Flutter SDK?',
              ),
            ]),
          ]),
          div([
            img(
                classes: 'arrow-2',
                src: '/images/Arrow07.png',
                styles: Styles(
                  height: Unit.pixels(100),
                ),
                alt: 'arrow-image')
          ])
        ]),
        div(classes: 'product-layout join-item', [
          div([
            img(
                src: '/images/number-3-svgrepo-com.svg',
                styles: Styles(
                  width: Unit.pixels(100),
                ),
                alt: 'number-3-image')
          ]),
          div([
            p([
              text(
                'Do you agree with the Flutteristas ',
              ),
              a(
                href: CodeOfConductPage.route.path,
                events: {
                  'click': (event) {
                    event.preventDefault();
                    Router.of(context).push(CodeOfConductPage.route.path);
                  },
                },
                [
                  text('Code of conduct'),
                ],
              ),
              text(
                '?',
              )
            ]),
          ])
        ])
      ]),
      div(
        classes: 'join-section',
        [
          img(src: '/images/flutteristas-dash.png', alt: 'dash'),
          a(
            classes: 'hero-button',
            href:
                'https://docs.google.com/forms/d/e/1FAIpQLScR2hQ44u_zxgpOaxcZZAnOmVZoIllehX8Iv9HKot2KmIMxzA/viewform',
            target: Target.blank,
            [text('Apply now')],
          )
        ],
      )
    ]);
  }
}

class _ProductItem extends StatefulComponent {
  const _ProductItem({
    required this.image,
    required this.route,
  });

  final String image;
  final Route route;

  @override
  State<_ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<_ProductItem> {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    Unit.em(1);
    yield div(
      classes: 'welcome-item',
      [
        a(
          href: component.route.path,
          events: {
            'click': (event) {
              event.preventDefault();
              Router.of(context).push(component.route.path);
            },
          },
          [
            Column(
              children: [
                img(
                  src: component.image,
                  width: 200,
                  height: 200,
                ),
                text(component.route.title!),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
