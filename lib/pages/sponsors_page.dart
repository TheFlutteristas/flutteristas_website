import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/ui.dart';

class SponsorsList extends StatefulComponent {
  const SponsorsList({
    super.key,
    required this.projectId,
    required this.category,
    required this.conferenceYear,
  });

  final String projectId;
  final String category;
  final String conferenceYear;

  @override
  State<SponsorsList> createState() => _SponsorsState();
}

class _SponsorsState extends State<SponsorsList> {
  late Future<List<SponsorItem>> _futureSponsorItems;

  @override
  void initState() {
    super.initState();
    _futureSponsorItems = fetchSponsor();
  }

  Future<List<SponsorItem>> fetchSponsor() async {
    // see: https://firebase.google.com/docs/reference/rest/database
    final url =
        "https://${component.projectId}.firebaseio.com/sponsors/conference_year/${component.conferenceYear}/${component.category}.json";
    final resp = await http.get(Uri.parse(url));
    final data = json.decode(resp.body);

    if (data == null) {
      return [];
    } else {
      var dataFiltered = (data as List).nonNulls.toList();

      return [
        ...(dataFiltered) //
            .cast<Map<String, dynamic>>()
            .map(SponsorItem.fromJson),
      ];
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Row(children: [
      FutureBuilder<List<SponsorItem>>(
          initialData: <SponsorItem>[],
          future: _futureSponsorItems,
          builder: (BuildContext context,
              AsyncSnapshot<List<SponsorItem>> snapshot) sync* {
            if (snapshot.data!.isEmpty) {
              yield div([
                p([text('Sponsors Coming Soon ...')])
              ]);
            } else {
              for (final (index, item) in snapshot.requireData.indexed) {
                yield div(
                  classes: 'sponsorItem',
                  id: 'sponsors-$index',
                  [
                    a(target: Target.blank, href: item.website, [
                      img(
                          classes: 'sponsor-photo',
                          src: item.logoLink,
                          alt: 'sponsor-photo')
                    ]),
                    h4(classes: 'sponsor-name', [
                      text(item.name),
                    ]),
                  ],
                );
              }
            }
          })
    ]);
  }
}

class SponsorItem {
  const SponsorItem(
      {
      // required this.conference_year,
      required this.name,
      required this.logoLink,
      required this.website});

  // final String conference_year;
  final String name;
  final String logoLink;
  final String website;

  static SponsorItem fromJson(Map<String, dynamic> json) {
    return SponsorItem(
      // conference_year: json['conference_year'] as String,
      name: json['sponsor_name'] as String,
      logoLink: json['sponsor_logo'] as String,
      website: json['website'] as String,
    );
  }

  @override
  String toString() => 'SponsorItem{}';
}
