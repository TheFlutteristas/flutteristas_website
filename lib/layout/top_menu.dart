import 'package:flutteristas/app/app.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:web/web.dart';

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
    _selected = routes.values.toList().indexOf(route);
  }

  void _onNavItemSelected(int index, String path) {
    setState(() => _selected = index);
    Router.of(context).push(path);
    (document.querySelector('.toggle') as HTMLInputElement).checked = false;
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
        for (final (index, MapEntry(:key, :value)) in routes.entries.indexed) //
          li([
            a(
              href: key,
              events: {
                'click': (event) {
                  event.preventDefault();
                  _onNavItemSelected(index, key);
                },
              },
              classes: index == _selected ? 'current' : null,
              [text(value.title!)],
            ),
          ]),
      ]),
    ]);
  }
}
