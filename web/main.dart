import 'package:jaspr/browser.dart';
import 'package:flutteristas/app/app.dart';
// import 'dart:html';

Future<void> main() async {
  //test calling rest API was successful...
  // try {
  //   var data = await HttpRequest.getString(
  //       'https://flutteristas-website-dev-default-rtdb.firebaseio.com/Agenda.json');
  //   print('The data from Firebase: $data');
  // } catch (e) {
  //   print('Sometihng went wrong: $e');
  // }
  runApp(App());
}
