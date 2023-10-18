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

class AgendaTalkList extends StatefulComponent {
  const AgendaTalkList({
    super.key,
    required this.projectId,
  });

  final String projectId;

  @override
  State<AgendaTalkList> createState() => _AgendaState();
}

class _AgendaState extends State<AgendaTalkList> {
  late Future<List<AgendaItem>> _futureAgendaItems;

  @override
  void initState() {
    super.initState();
    _futureAgendaItems = fetchAgenda();
  }

  Future<List<AgendaItem>> fetchAgenda() async {
    // see: https://firebase.google.com/docs/reference/rest/database
    final url =
        "https://${component.projectId}.firebaseio.com/conference_agenda.json";
    final resp = await http.get(Uri.parse(url));
    final data = json.decode(resp.body);
    return [
      ...(data as List) //
          .cast<Map<String, dynamic>>()
          .map(AgendaItem.fromJson),
    ];
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield FutureBuilder<List<AgendaItem>>(
      initialData: <AgendaItem>[],
      future: _futureAgendaItems,
      builder: (BuildContext context,
          AsyncSnapshot<List<AgendaItem>> snapshot) sync* {
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
                  text('Title: '),
                  strong([text(item.title)]),
                  br(),
                  text('Speaker: '),
                  strong([text(item.speaker)]),
                  br(),
                  text(item.description),
                  br(),
                  text(
                    'at: '
                    //'${DateFormat.yMMMd().format(item.time)} at '
                    '${DateFormat.Hms().format(item.time)} UTC',
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}

class AgendaItem {
  const AgendaItem({
    required this.title,
    required this.speaker,
    required this.description,
    required this.time,
  });

  final String title;
  final String speaker;
  final String description;
  final DateTime time;

  static AgendaItem fromJson(Map<String, dynamic> json) {
    return AgendaItem(
      title: json['title'] as String,
      speaker: json['speaker'] as String,
      description: json['description'] as String,
      time: DateTime.parse(json['time'] as String),
    );
  }

  @override
  String toString() => 'AgendaItem{$title, $time}';
}
