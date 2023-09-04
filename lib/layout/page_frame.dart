import 'dart:html';

import 'package:flutteristas/layout/top_menu.dart';
import 'package:jaspr/html.dart';
import 'package:jaspr_router/jaspr_router.dart';

class PageFrame extends StatefulComponent {
  const PageFrame({
    super.key,
    required this.child,
  });

  final Component child;

  @override
  State<PageFrame> createState() => _PageFrameState();
}

class _PageFrameState extends State<PageFrame> {
  String? _title;

  @override
  void initState() {
    super.initState();
    _updateTitle();
  }

  @override
  void didUpdateComponent(covariant PageFrame oldComponent) {
    super.didUpdateComponent(oldComponent);
    _updateTitle();
  }

  void _updateTitle() {
    // NOTE: this should work, bug in Jaspr see https://github.com/schultek/jaspr/pull/110
    // _title = Router.of(context).matchList.title;
    // Instead we are fixing it inline here as a workaround
    final matches = Router.of(context).matchList.matches;
    _title = matches.reversed.fold(
      null,
      (prev, match) => prev ?? (match.route is Route ? (match.route as Route).title : null),
    );
    if (_title case String title) {
      document.title = '$title :: Flutteristas';
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: ['page'],
      [
        img(
          id: 'top-banner',
          src: '/images/top_banner.png',
        ),
        TopMenu(),
        article([
          div(id: 'post-content', [
            if (_title case String title) //
              h1([text(title)]),
            component.child,
          ]),
        ]),
        footer([
          Text('Copyright © 2023 Flutteristas.org.  All rights reserved. '),
        ]),
      ],
    );
  }
}
