import 'dart:convert';
import 'package:jaspr/components.dart';
import 'package:jaspr/html.dart';
import 'package:http/http.dart' as http;

class OrganizersList extends StatefulComponent {
  const OrganizersList({
    super.key,
    required this.projectId,
    required this.conferenceYear,
  });

  final String projectId;
  final String conferenceYear;

  @override
  State<OrganizersList> createState() => _OrganizersState();
}

class _OrganizersState extends State<OrganizersList> {
  late Future<List<OrganizerItem>> _futureOrganizerItems;

  @override
  void initState() {
    super.initState();
    _futureOrganizerItems = fetchOrganizer();
  }

  Future<List<OrganizerItem>> fetchOrganizer() async {
    // see: https://firebase.google.com/docs/reference/rest/database
    final url =
        "https://${component.projectId}.firebaseio.com/organiser_team/conference_year/${component.conferenceYear}.json";
    final resp = await http.get(Uri.parse(url));
    final data = json.decode(resp.body);
    var dataFiltered = (data as List).nonNulls.toList();
    List<OrganizerItem> speakerList = dataFiltered
        .cast<Map<String, dynamic>>()
        .map((d) => OrganizerItem.fromJson(d))
        .toList();
    speakerList.sort((a, b) {
      return a.first_name.toLowerCase().compareTo(b.first_name.toLowerCase());
    });

    return speakerList;
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Grid(columns: 4, gap: Unit.pixels(30), spread: true, children: [
      FutureBuilder<List<OrganizerItem>>(
        initialData: <OrganizerItem>[],
        future: _futureOrganizerItems,
        builder: (BuildContext context,
            AsyncSnapshot<List<OrganizerItem>> snapshot) sync* {
          for (final (index, item) in snapshot.requireData.indexed) {
            Map<dynamic, dynamic> socialIcons = item.socialMedia;
            yield div(
              classes: ['OrganizerItem'],
              id: 'item-$index',
              [
                img(
                    classes: ['Organizer-photo'],
                    src: item.photoLink,
                    alt: 'Organizer-photo'),
                div(classes: [
                  'social-bar'
                ], [
                  for (var item in socialIcons.entries) social_icon(item),
                ]),
                h3(classes: [
                  'Organizer-name'
                ], [
                  text(item.first_name),
                  text(' '),
                  text(item.last_name),
                  div(classes: [
                    'Organizer-bio'
                  ], [
                    p([text(item.bio)])
                  ])
                ]),
                item.company != ''
                    ? div(classes: [
                        'company'
                      ], [
                        img(
                            classes: ['company-icon'],
                            src: '/images/company-svgrepo-com.svg',
                            alt: 'company-icon'),
                        text(item.company)
                      ])
                    : span([]),
                p(classes: ['Organizer-role'], [text(item.professionalRole)]),
              ],
            );
          }
        },
      )
    ]);
  }

  Component social_icon(MapEntry<dynamic, dynamic> item) {
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

class OrganizerItem {
  const OrganizerItem(
      {
      // required this.conference_year,
      required this.first_name,
      required this.last_name,
      required this.bio,
      required this.photoLink,
      required this.professionalRole,
      required this.company,
      required this.socialMedia});

  // final String conference_year;
  final String first_name;
  final String last_name;
  final String bio;
  final String photoLink;
  final String professionalRole;
  final Map socialMedia;
  final String company;

  static OrganizerItem fromJson(Map<String, dynamic> json) {
    return OrganizerItem(
      // conference_year: json['conference_year'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      bio: json['bio'] as String,
      photoLink: json['photo'] as String,
      socialMedia: json['socialmedia'] as Map,
      professionalRole: json['role'] as String,
      company: json['company_name'] as String,
    );
  }

  @override
  String toString() => 'SpeakerItem{}';
}
