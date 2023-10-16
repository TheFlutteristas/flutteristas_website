import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:jaspr/components.dart';
import 'package:jaspr/html.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:http/http.dart' as http;

// class AgendaPage extends StatelessComponent {
//   const AgendaPage({super.key});
//
//   static final route = Route(
//     path: '/agenda',
//     title: 'Agenda',
//     builder: (context, state) => AgendaPage(),
//   );
//
//   @override
//   Iterable<Component> build(BuildContext context) sync* {
//     yield AgendaTalkList(
//       projectId: 'flutteristas-website-dev-default-rtdb',
//     );
//   }
// }

class SpeakersList extends StatefulComponent {
  const SpeakersList({
    super.key,
    required this.projectId,
  });

  final String projectId;

  @override
  State<SpeakersList> createState() => _SpeakersState();
}

class _SpeakersState extends State<SpeakersList> {
  late Future<List<SpeakerItem>> _futureSpeakerItems;

  @override
  void initState() {
    super.initState();
    _futureSpeakerItems = fetchSpeaker();
  }

  Future<List<SpeakerItem>> fetchSpeaker() async {
    // see: https://firebase.google.com/docs/reference/rest/database
    final url =
        "https://${component.projectId}.firebaseio.com/speakers/conference_year/2023.json";
    // https: //flutteristas-website-dev-default-rtdb.firebaseio.com/speakers/conference_year/2023
    final resp = await http.get(Uri.parse(url));
    final data = json.decode(resp.body);
    return [
      ...(data as List) //
          .cast<Map<String, dynamic>>()
          .map(SpeakerItem.fromJson),
    ];
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield FutureBuilder<List<SpeakerItem>>(
      initialData: <SpeakerItem>[],
      future: _futureSpeakerItems,
      builder: (BuildContext context,
          AsyncSnapshot<List<SpeakerItem>> snapshot) sync* {
        for (final (index, item) in snapshot.requireData.indexed) {
          yield div(
            id: 'item-$index',
            styles: Styles.box(
              border: Border.all(
                BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.purple,
                  width: Unit.pixels(1),
                ),
              ),
              padding: EdgeInsets.all(Unit.em(0.5)),
              margin: EdgeInsets.only(bottom: Unit.em(1.0)),
            ),
            [
              p(
                [
                  text('Name: '),
                  // text(item.toString()),
                  strong([text(item.name)]),
                  br(),
                  // text('Bio: '),
                  // strong([text(item.bio)]),
                  br(),
                  text(item.professional_role),
                  br(),
                  // text(
                  //   'at: '
                  //   //'${DateFormat.yMMMd().format(item.time)} at '
                  //   '${DateFormat.Hms().format(item.time)} UTC',
                  // ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}

class SpeakerItem {
  const SpeakerItem({
    // required this.conference_year,
    required this.name,
    required this.professional_role,
  });

  // final String conference_year;
  final String name;
  final String professional_role;

  static SpeakerItem fromJson(Map<String, dynamic> json) {
    return SpeakerItem(
      // conference_year: json['conference_year'] as String,
      name: json['name'] as String,
      professional_role: json['professional_role'] as String,
    );
  }

  @override
  String toString() => 'SpeakerItem{}';
}
