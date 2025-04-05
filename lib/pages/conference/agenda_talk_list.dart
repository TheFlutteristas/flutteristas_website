import 'package:collection/collection.dart';
import 'package:flutteristas/models/agenda_item.dart';
import 'package:flutteristas/utilities/extensions.dart';
import 'package:intl/intl.dart';
import 'package:jaspr/jaspr.dart';

class AgendaTalkList extends StatefulComponent {
  const AgendaTalkList({
    super.key,
    required this.conferenceYear,
  });

  final String conferenceYear;

  @override
  State<AgendaTalkList> createState() => _AgendaTalkList();
}

class _AgendaTalkList extends State<AgendaTalkList> {
  late Future<List<AgendaItem>> _futureAgendaItems;

  @override
  void initState() {
    super.initState();
    _futureAgendaItems = fetchAgenda();
  }

  Future<List<AgendaItem>> fetchAgenda() async {
    return await context.dataFetcher.fetchData(
      '/conference_agenda/conference_year/${component.conferenceYear}',
      fromJson: (data) {
        return (data as List? ?? [])
            .nonNulls
            .cast<Map<String, dynamic>>()
            .map(AgendaItem.fromJson)
            .sorted((a, b) {
          return a.time.compareTo(b.time);
        });
      },
    );
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      p(classes: 'tune-in', [text('Tune-in on')]),
      //TODO we need to add the conference date as a record in the database to fetch it here
      h3(classes: 'conf-date', [
        component.conferenceYear == '2025' //
            ? text('5 April 2025')
            : text('11 November 2023'),
      ]),
      FutureBuilder<List<AgendaItem>>(
        initialData: <AgendaItem>[],
        future: _futureAgendaItems,
        builder: (BuildContext context, AsyncSnapshot<List<AgendaItem>> snapshot) sync* {
          if (snapshot.hasData == false) {
            yield div([
              p([text('Agenda Coming Soon ...')])
            ]);
          } else {
            for (final (index, item) in snapshot.requireData.indexed) {
              final speakersList = item.speakers;
              yield div(
                classes: 'agenda-item',
                id: 'agenda-item-$index',
                [
                  div(classes: 'date-container', [
                    p(classes: 'agenda-date', [
                      //convert time from UTC to local timing
                      text(
                        component.conferenceYear == '2025'
                            ? DateFormat.jm()
                                .format(
                                  DateTime.parse(
                                          '${component.conferenceYear}-04-05 ${item.time.padLeft(5, '0')}Z')
                                      .toLocal(),
                                )
                                .toLowerCase()
                            : DateFormat.jm()
                                .format(
                                  DateTime.parse(
                                          '${component.conferenceYear}-11-11 ${item.time.padLeft(5, '0')}Z')
                                      .toLocal(),
                                )
                                .toLowerCase(),
                      ),
                      text(' '),
                      component.conferenceYear == '2025'
                          ? text(DateTime.parse(
                                  '${component.conferenceYear}-04-05 ${item.time.padLeft(5, '0')}')
                              .toLocal()
                              .timeZoneName
                              .split(' ')
                              .map((e) => e[0])
                              .join())
                          : text(DateTime.parse(
                                  '${component.conferenceYear}-11-11 ${item.time.padLeft(5, '0')}')
                              .toLocal()
                              .timeZoneName
                              .split(' ')
                              .map((e) => e[0])
                              .join()),
                    ]),
                    p(classes: 'agenda-date-utc', [
                      //Show time as UTC
                      text(
                        component.conferenceYear == '2025'
                            ? DateFormat.jm()
                                .format(
                                  DateTime.parse(
                                      '${component.conferenceYear}-04-05 ${item.time.padLeft(5, '0')}Z'),
                                )
                                .toLowerCase()
                            : DateFormat.jm()
                                .format(
                                  DateTime.parse(
                                      '${component.conferenceYear}-11-11 ${item.time.padLeft(5, '0')}Z'),
                                )
                                .toLowerCase(),
                      ),
                      text(' UTC'),
                    ])
                  ]),
                  div(classes: 'talk-info', [
                    p(
                      classes: 'talk-title',
                      [
                        item.type == 'talk'
                            ? img(
                                classes: 'type-icon',
                                src: '/images/female-user-talk-chat-svgrepo-com.svg',
                              )
                            : img(
                                classes: 'type-icon',
                                src: '/images/activity-community-group-svgrepo-com.svg'),
                        strong([text(item.title)]),
                        item.description != ''
                            ? img(classes: 'type-icon', src: '/images/arrow-down-svgrepo-com.svg')
                            : span([]),
                        p(classes: 'talk-description', [text(item.description)])
                      ],
                    ),
                    div(classes: 'speaker-container', [
                      for (var item in speakersList)
                        item['name'] != ''
                            ? div(classes: 'speaker-profile', [
                                img(classes: 'speaker-img', src: item['photo']),
                                div([
                                  p(classes: 'speaker-name', [text(item['name'])]),
                                  p(classes: 'speaker-role', [text(item['company'])])
                                ])
                              ])
                            : span([]),
                    ])
                  ])
                ],
              );
            }
          }
        },
      )
    ]);
  }
}
