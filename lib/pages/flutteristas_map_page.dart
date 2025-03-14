import 'package:jaspr/ui.dart';
import 'package:jaspr_router/jaspr_router.dart';

class FlutteristasMapPage extends StatelessComponent {
  const FlutteristasMapPage({super.key});

  static final path = '/flutteristas-map';

  static final route = Route(
    path: '/flutteristas-map',
    title: 'Flutteristas Map',
    builder: (context, state) => FlutteristasMapPage(),
  );

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'map', [
      Spacer(height: Unit.pixels(50)),
      iframe(
          classes: 'map-iframe',
          [],
          src: 'https://www.google.com/maps/d/u/0/embed?'
              'mid=1RU8SFU9MbegyUAnX8p9DvuinxsbgQBA&ehbc=2E312F&noprof=1'),
    ]);
  }
}
