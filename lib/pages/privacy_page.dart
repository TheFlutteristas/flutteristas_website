import 'package:jaspr/ui.dart';
import 'package:jaspr_router/jaspr_router.dart';

class PrivacyPolicyPage extends StatelessComponent {
  const PrivacyPolicyPage._();

  static final path = '/privacy-policy';

  static final route = Route(
    path: '/privacy-policy',
    title: 'Privacy Policy',
    builder: (context, state) => PrivacyPolicyPage._(),
  );

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield p([text('Effective Date: 29-Aug-2023')]);
    yield h2([text('Who we are')]);
    yield div(
      styles: Styles(
        padding: Spacing.all(Unit.em(1)),
        color: Colors.white,
        backgroundColor: Color.value(0x555555),
      ),
      [text('Our website address is: https://Flutteristas.org')],
    );
    yield Spacer(height: Unit.em(1));
    yield h2([text('App Data')]);
    yield p([
      text(
        'Our published apps do NOT currently collect any data. '
        'If in the future we create apps which collect data, '
        'we will update this Privacy Policy.',
      )
    ]);
    yield p([
      text(
        'Our published apps do NOT transmit to or store '
        'any data to our website or server(s).',
      )
    ]);
    yield p([
      text(
        'Any apps in testing may collect usage and/or crash '
        'data, if you choose to share this data it will be '
        'transmitted to us.',
      )
    ]);
    yield Spacer(height: Unit.em(1));
    yield h2([text('Website Data')]);
    yield p([
      text(
        'Data transmitted via our Contact Us page links '
        'are managed by the respective sites.',
      ),
      div(
        styles: Styles(
          flexDirection: FlexDirection.column,
          lineHeight: Unit.em(2.5),
          margin: Spacing.only(left: Unit.em(2.0)),
        ),
        [
          // a(
          //   href: 'https://www.facebook.com/privacy/explanation',
          //   target: Target.blank,
          //   [text('Facebook/Meta')],
          // ),
          a(
            href: 'https://twitter.com/en/privacy',
            target: Target.blank,
            [text('Twitter/X')],
          ),
        ],
      ),
    ]);
    yield p([
      text('We use '),
      a(
        [text('basic Google Analytics')],
        href: 'https://analytics.google.com/',
        target: Target.blank,
      ),
      text(' on our website to understand how our site is used. You can see '),
      a(
        [text('Google’s privacy policy')],
        href: 'https://policies.google.com/privacy',
        target: Target.blank,
      ),
      text(
        ' for more details. The lowest level of detail we see is, '
        'if the data is available:',
      ),
    ]);
    yield ul([
      li([
        text('Acquisition: How you reached our site (ex. direct or search)')
      ]),
      li([
        text(
            'Demographics: Language, Country, and City (NOT your specific location)')
      ]),
      li([
        text(
            'Mobile: Device brand, model, marketing name, and screen resolution')
      ]),
      li([
        text(
            'Technology: Browser & operating system and Internet service provider')
      ]),
    ]);
    yield Spacer(height: Unit.em(3.0));
  }
}
