import 'package:flutteristas/models/sponsor_item.dart';
import 'package:flutteristas/utilities/extensions.dart';
import 'package:jaspr/ui.dart';

class SponsorsList extends StatefulComponent {
  const SponsorsList({
    super.key,
    required this.category,
    required this.conferenceYear,
    required this.columnCount
  });

  final String category;
  final String conferenceYear;
  final int columnCount;

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
    return await context.dataFetcher.fetchData(
      '/sponsors/conference_year/${component.conferenceYear}/${component.category}',
      fromJson: (data) {
        return (data as List? ?? [])
            .nonNulls
            .cast<Map<String, dynamic>>()
            .map(SponsorItem.fromJson)
            .toList();
      },
    );
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Grid(columns: component.columnCount, gap: Unit.pixels(30), spread: true, children: [
      FutureBuilder<List<SponsorItem>>(
        initialData: <SponsorItem>[],
        future: _futureSponsorItems,
        builder: (BuildContext context, AsyncSnapshot<List<SponsorItem>> snapshot) sync* {
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
                  a(
                    target: Target.blank,
                    href: item.website,
                    [img(classes: 'sponsor-photo', src: item.logoLink, alt: 'sponsor-photo')],
                  ),
                ],
              );
            }
          }
        },
      )
    ]);
  }
}
