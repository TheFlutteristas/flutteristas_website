import 'dart:html';
import 'package:flutteristas/app/app.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class TopMenu extends StatefulComponent {
  const TopMenu();

  @override
  State<StatefulComponent> createState() => TopMenuState();
}

class TopMenuState extends State {
  late int _selected;

  @override
  void initState() {
    super.initState();
    _updateSelected();
  }

  @override
  void didUpdateComponent(covariant StatefulComponent oldComponent) {
    super.didUpdateComponent(oldComponent);
    _updateSelected();
  }

  void _updateSelected() {
    final route = Router.of(context).matchList.last.route as Route;
    _selected = routes.indexOf(route);
  }

  void _onNavItemSelected(int index, Route route) {
    setState(() => _selected = index);
    Router.of(context).push(route.path);
    (querySelector('.toggle') as CheckboxInputElement).checked = false;
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield nav([
      input(
        id: 'menu-state',
        classes: 'toggle',
        type: InputType.checkbox,
        [],
      ),
      label(
        htmlFor: 'menu-state',
        classes: 'menu-toggle',
        [
          i([], classes: 'icon fa fa-solid fa-bars'),
          text('Menu'),
        ],
      ),
      ul([
        for (final (index, route) in routes.indexed) //
          li([
            a(
              href: route.path,
              events: {
                'click': (event) {
                  _onNavItemSelected(index, route);
                  (event as Event).preventDefault();
                },
              },
              classes: index == _selected ? 'current' : null,
              [Text(route.title!)],
            ),
          ]),
      ]),
    ]);
  }
}
