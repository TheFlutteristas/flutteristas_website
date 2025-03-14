import 'package:collection/collection.dart';
import 'package:flutteristas/models/organizer_item.dart';
import 'package:flutteristas/utilities/extensions.dart';
import 'package:jaspr/ui.dart';

class OrganizersList extends StatefulComponent {
  const OrganizersList({
    super.key,
    required this.conferenceYear,
  });

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
    return await context.dataFetcher.fetchData(
      '/organiser_team/conference_year/${component.conferenceYear}',
      fromJson: (data) {
        return (data as List? ?? [])
            .nonNulls
            .cast<Map<String, dynamic>>()
            .map(OrganizerItem.fromJson)
            .sorted((a, b) {
          return a.firstName.toLowerCase().compareTo(b.firstName.toLowerCase());
        });
      },
    );
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Grid(columns: 4, gap: Unit.pixels(30), spread: true, children: [
      FutureBuilder<List<OrganizerItem>>(
        initialData: <OrganizerItem>[],
        future: _futureOrganizerItems,
        builder: (BuildContext context, AsyncSnapshot<List<OrganizerItem>> snapshot) sync* {
          if (snapshot.data!.isEmpty) {
            yield div([
              p([text('Organaizers Coming Soon ...')])
            ]);
          } else {
            for (final (index, item) in snapshot.requireData.indexed) {
              Map<dynamic, dynamic> socialIcons = item.socialMedia;
              yield div(
                classes: 'OrganizerItem',
                id: 'organizer-$index',
                [
                  img(classes: 'Organizer-photo', src: item.photoLink, alt: 'Organizer-photo'),
                  div(classes: 'social-bar', [
                    for (var item in socialIcons.entries) socialIcon(item),
                  ]),
                  h3(classes: 'Organizer-name', [
                    text(item.firstName),
                    text(' '),
                    text(item.lastName),
                    div(classes: 'Organizer-bio', [
                      p([text(item.bio)])
                    ])
                  ]),
                  item.company != ''
                      ? div(classes: 'company', [
                          img(
                              classes: 'company-icon',
                              src: '/images/company-svgrepo-com.svg',
                              alt: 'company-icon'),
                          text(item.company)
                        ])
                      : span([]),
                  p(classes: 'Organizer-role', [text(item.professionalRole)]),
                ],
              );
            }
          }
        },
      )
    ]);
  }

  Component socialIcon(MapEntry<dynamic, dynamic> item) {
    if (item.value == '') {
      return span(classes: 'empty-span', []);
    } else {
      switch (item.key as String) {
        case 'bluesky':
          return a(
            href: item.value as String,
            target: Target.blank,
            [img(src: '/images/bluesky-icon.svg', alt: 'bluesky-icon')],
          );
        case 'x':
          return a(
            href: item.value as String,
            target: Target.blank,
            [img(src: '/images/x-logo.svg', alt: 'x-icon')],
          );

        case 'linkedin':
          return a(
            href: item.value as String,
            target: Target.blank,
            [img(src: '/images/Linkedin.svg', alt: 'linkedin-icon')],
          );
        case 'github':
          return a(
            href: item.value as String,
            target: Target.blank,
            [img(src: '/images/github-color-svgrepo-com.svg', alt: 'github-icon')],
          );
        case 'medium':
          return a(
            href: item.value as String,
            target: Target.blank,
            [img(src: '/images/medium-svgrepo-com.svg', alt: 'medium-icon')],
          );
        case 'youtube':
          return a(
            href: item.value as String,
            target: Target.blank,
            [img(src: '/images/youtube.svg', alt: 'youtube-icon')],
          );
        default:
          return span([]);
      }
    }
  }
}
