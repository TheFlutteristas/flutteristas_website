import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:jaspr/html.dart';
//import 'package:jaspr_router/jaspr_router.dart';
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
        "https://${component.projectId}.firebaseio.com/conference_agenda/conference_year/2023.json";
    final resp = await http.get(Uri.parse(url));
    final data = json.decode(resp.body);
    var dataFiltered = (data as List).nonNulls.toList();
    List<AgendaItem> speakerList = dataFiltered
        .cast<Map<String, dynamic>>()
        .map((d) => AgendaItem.fromJson(d))
        .toList();
    speakerList.sort((a, b) {
      return a.time.compareTo(b.time);
    });

    return speakerList;
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      p(classes: ['tune-in'], [text('Tune-in on')]),
      h3(classes: ['conf-date'], [text('11 November 2023')]),
      FutureBuilder<List<AgendaItem>>(
        initialData: <AgendaItem>[],
        future: _futureAgendaItems,
        builder: (BuildContext context,
            AsyncSnapshot<List<AgendaItem>> snapshot) sync* {
          for (final (index, item) in snapshot.requireData.indexed) {
            List<dynamic> speakersList = item.speakers;
            yield div(
              classes: ['agenda-item'],
              id: 'item-$index',
              [
                div(classes: [
                  'date-container'
                ], [
                  p(classes: [
                    'agenda-date'
                  ], [
                    //convert time from PTS to UTC then convert it to local timing
                    text(DateFormat.jm().format(DateTime.parse('${item.time}')
                        .add(Duration(hours: 8))
                        .toLocal()))
                  ]),
                  p(classes: [
                    'date-zone'
                  ], [
                    //show the time zone for the current user
                    text(DateTime.parse('${item.time}').toLocal().timeZoneName)
                  ])
                ]),
                div(classes: [
                  'talk-info'
                ], [
                  p(
                    classes: ['talk-title'],
                    [
                      item.type == 'talk'
                          ? img(
                              classes: ['type-icon'],
                              src:
                                  'images/female-user-talk-chat-svgrepo-com.svg',
                            )
                          : img(
                              classes: ['type-icon'],
                              src:
                                  'images/activity-community-group-svgrepo-com.svg'),
                      strong([text(item.title)]),
                      item.description != ''
                          ? img(
                              classes: ['type-icon'],
                              src: 'images/arrow-down-svgrepo-com.svg')
                          : span([]),
                      p(classes: ['talk-description'], [text(item.description)])
                    ],
                  ),
                  div(classes: [
                    'speaker-container'
                  ], [
                    for (var item in speakersList)
                      item['name'] != ''
                          ? div(classes: [
                              'speaker-profile'
                            ], [
                              img(classes: ['speaker-img'], src: item['photo']),
                              div([
                                p(
                                    classes: ['speaker-name'],
                                    [text(item['name'])]),
                                p(
                                    classes: ['speaker-role'],
                                    [text(item['company'])])
                              ])
                            ])
                          : span([]),
                  ])
                ])
              ],
            );
          }
        },
      )
    ]);
  }
}

class AgendaItem {
  const AgendaItem({
    required this.title,
    required this.speakers,
    required this.description,
    required this.time,
    required this.type,
  });

  final String title;
  final List speakers;
  final String description;
  final String type;
  final DateTime time;

  static AgendaItem fromJson(Map<String, dynamic> json) {
    return AgendaItem(
      title: json['title'] as String,
      speakers: json['speaker'] as List,
      description: json['description'] as String,
      time: DateTime.parse('2023-11-11 ' + json['start_time'] + 'z'),
      type: json['schedule_type'] as String,
    );
  }

  @override
  String toString() => 'AgendaItem{$title}';
}
