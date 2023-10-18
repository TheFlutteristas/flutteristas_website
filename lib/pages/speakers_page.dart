import 'dart:convert';
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
    return [
      ...(data as List) //
          .cast<Map<String, dynamic>>()
          .map(SpeakerItem.fromJson),
    ];
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
                img(classes: ['speaker-photo'], src: item.photoLink),
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
                  'social-bar'
                ], [
                  for (var item in socialIcons.entries) social_icon(item),
                  // a(
                  //     href: socialIcons['x'] as String,
                  //     target: Target.blank,
                  //     [img(src: '/images/x-logo.svg', width: 16)]),
                ]),
                // p(classes: ['speaker-bio'], [text(item.bio)]),
              ],
            );
          }
        },
      )
    ]);
  }

  Component social_icon(MapEntry<dynamic, dynamic> item) {
    if (item.value != null) {
      switch (item.key as String) {
        case 'x':
          return a(
              href: item.value as String,
              target: Target.blank,
              [img(src: '/images/x-logo.svg')]);

        case 'linkedin':
          return a(
              href: item.value as String,
              target: Target.blank,
              [img(src: '/images/Linkedin.svg')]);
        case 'github':
          return a(
              href: item.value as String,
              target: Target.blank,
              [img(src: '/images/github-color-svgrepo-com.svg')]);
        case 'medium':
          return a(
              href: item.value as String,
              target: Target.blank,
              [img(src: '/images/medium-svgrepo-com.svg')]);
        case 'youtube':
          return a(
              href: item.value as String,
              target: Target.blank,
              [img(src: '/images/youtube.svg')]);
        default:
          return span([]);
      }
    } else {
      throw Exception('no social value found');
    }
  }
}

class SpeakerItem {
  const SpeakerItem(
      {
      // required this.conference_year,
      required this.name,
      required this.bio,
      required this.photoLink,
      required this.professionalRole,
      required this.socialMedia});

  // final String conference_year;
  final String name;
  final String bio;
  final String photoLink;
  final String professionalRole;
  final Map socialMedia;

  static SpeakerItem fromJson(Map<String, dynamic> json) {
    return SpeakerItem(
      // conference_year: json['conference_year'] as String,
      name: json['name'] as String,
      bio: json['bio'] as String,
      photoLink: json['photo'] as String,
      socialMedia: json['socialmedia'] as Map,
      professionalRole: json['professional_role'] as String,
    );
  }

  @override
  String toString() => 'SpeakerItem{}';
}
