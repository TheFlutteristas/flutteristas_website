import 'dart:convert';
import 'package:flutteristas/modules/SpeakerItem.dart';
import 'package:jaspr/components.dart';
import 'package:jaspr/html.dart';
import 'package:http/http.dart' as http;

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
    final resp = await http.get(Uri.parse(url));
    final data = json.decode(resp.body);
    var dataFiltered = (data as List).nonNulls.toList();
    List<SpeakerItem> speakerList = dataFiltered
        .cast<Map<String, dynamic>>()
        .map((d) => SpeakerItem.fromJson(d))
        .toList();
    speakerList.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });

    return speakerList;
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Grid(columns: 4, gap: Unit.pixels(30), spread: true, children: [
      FutureBuilder<List<SpeakerItem>>(
        initialData: <SpeakerItem>[],
        future: _futureSpeakerItems,
        builder: (BuildContext context,
            AsyncSnapshot<List<SpeakerItem>> snapshot) sync* {
          for (final (index, item) in snapshot.requireData.indexed) {
            Map<dynamic, dynamic> socialIcons = item.socialMedia;

            yield div(
              classes: ['SpeakerItem'],
              id: 'item-$index',
              [
                img(
                    classes: ['speaker-photo'],
                    src: item.photoLink,
                    alt: 'speaker-photo'),
                div(classes: [
                  'social-bar'
                ], [
                  for (var item in socialIcons.entries) socialIcon(item),
                ]),
                h3(classes: [
                  'speaker-name'
                ], [
                  text(item.name),
                  div(classes: [
                    'speaker-bio'
                  ], [
                    p([text(item.bio)])
                  ])
                ]),
                p(classes: ['speaker-role'], [text(item.professionalRole)]),
                div(classes: [
                  'title-talk'
                ], [
                  p(classes: [
                    'talk-container'
                  ], [
                    img(
                        src: '/images/female-user-talk-chat-svgrepo-com.svg',
                        alt: 'speaker-icon'),
                    span(classes: ['talk-lable'], [text('Talk title: ')]),
                    span(classes: ['talk-title'], [text(item.titleTalk)])
                  ]),
                ]),
              ],
            );
          }
        },
      )
    ]);
  }

  Component socialIcon(MapEntry<dynamic, dynamic> item) {
    if (item.value == '') {
      return span(classes: ['empty-span'], []);
    } else {
      switch (item.key as String) {
        case 'x':
          return a(
              href: item.value as String,
              target: Target.blank,
              [img(src: '/images/x-logo.svg', alt: 'twitter-icon')]);

        case 'linkedin':
          return a(
              href: item.value as String,
              target: Target.blank,
              [img(src: '/images/Linkedin.svg', alt: 'linkedin-icon')]);
        case 'github':
          return a(href: item.value as String, target: Target.blank, [
            img(src: '/images/github-color-svgrepo-com.svg', alt: 'github-icon')
          ]);
        case 'medium':
          return a(
              href: item.value as String,
              target: Target.blank,
              [img(src: '/images/medium-svgrepo-com.svg', alt: 'medium-icon')]);
        case 'youtube':
          return a(
              href: item.value as String,
              target: Target.blank,
              [img(src: '/images/youtube.svg', alt: 'youtube-icon')]);
        default:
          return span([]);
      }
    }
  }
}
