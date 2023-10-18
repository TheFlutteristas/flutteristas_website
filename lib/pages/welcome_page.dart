import 'dart:html';
// import 'package:flutteristas/pages/code_of_conduct.dart';
import 'package:flutteristas/pages/code_of_conduct.dart';
import 'package:jaspr/components.dart';
import 'package:jaspr/html.dart';
import 'package:jaspr_router/jaspr_router.dart';

class WelcomePage extends StatelessComponent {
  const WelcomePage({super.key});

  static final route = Route(
    path: '/',
    title: 'Home',
    builder: (context, state) => WelcomePage(),
  );

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: [
      'product-layout',
      'hero-section'
    ], [
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
          classes: ['hero-text'],
          [
            Text(
              'The Flutteristas is a world-wide community of people whose gender identity is either female or non-binary and '
              'have an interest in the Flutter SDK.💙',
            ),
          ],
        ),
        a(
          classes: ['hero-button'],
          href: '#join-layout',
          target: Target.self,
          [text('Apply now')],
        )
      ]),
      div([
        img(
          src: '/images/FlutterInteract-2019.jpg',
          styles: Styles.box(
            width: Unit.percent(100),
            radius: BorderRadius.circular(Unit.pixels(14.0)),
          ),
        )
      ])
    ]);
    yield Spacer(height: Unit.pixels(100));
    yield h2(
      [
        text('How to join?'),
      ],
    );
    //yield br();
    yield div(id: 'join-layout', classes: [
      'join-layout',
      'product-layout'
    ], [
      div([
        div(classes: [
          'product-layout',
          'join-item'
        ], [
          div([
            img(
              src: '/images/number-1-svgrepo-com.svg',
              styles: Styles.box(
                width: Unit.pixels(100),
              ),
            )
          ]),
          div([
            p([
              text(
                'Do you identify as a woman or non-binary who has an interest in the Flutter SDK?',
              )
            ]),
          ])
        ]),
        div(classes: [
          'product-layout',
          'join-item'
        ], [
          div([
            img(
              classes: ['arrow-1'],
              src: '/images/Arrow15.png',
              styles: Styles.box(
                height: Unit.pixels(100),
              ),
            )
          ]),
          div([
            img(
              src: '/images/number-2-svgrepo-com.svg',
              styles: Styles.box(
                width: Unit.pixels(100),
              ),
            )
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
              classes: ['arrow-2'],
              src: '/images/Arrow07.png',
              styles: Styles.box(
                height: Unit.pixels(100),
              ),
            )
          ])
        ]),
        div(classes: [
          'product-layout',
          'join-item'
        ], [
          div([
            img(
              src: '/images/number-3-svgrepo-com.svg',
              styles: Styles.box(
                width: Unit.pixels(100),
              ),
            )
          ]),
          div([
            p([
              text(
                'Do you agree with the Flutteristas ',
              ),
              a(
                href: CodeOfConduct.route.path,
                events: {
                  'click': (event) {
                    Router.of(context).push(CodeOfConduct.route.path);
                    (event as Event).preventDefault();
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
        classes: ['join-section'],
        [
          img(src: '/images/flutteristas-dash.png'),
          a(
            classes: ['hero-button'],
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
      classes: ['welcome-item'],
      [
        a(
          href: component.route.path,
          events: {
            'click': (event) {
              Router.of(context).push(component.route.path);
              (event as Event).preventDefault();
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
