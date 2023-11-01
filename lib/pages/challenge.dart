// import 'dart:convert';
// import 'package:jaspr/components.dart';
// import 'package:jaspr/html.dart';
// import 'package:http/http.dart' as http;

// class Challenge extends StatefulComponent {
//   const Challenge({
//     super.key,
//     required this.projectId,
//     required this.category,
//   });

//   final String projectId;
//   final String category;

//   @override
//   State<Challenge> createState() => _ChallengeState();
// }

// class _ChallengeState extends State<Challenge> {
//   late Future<List<ChallengeItem>> _futureChallengeItems;

//   @override
//   void initState() {
//     super.initState();
//     _futureChallengeItems = fetchChallenge();
//   }

//   Future<List<ChallengeItem>> fetchChallenge() async {
//     // see: https://firebase.google.com/docs/reference/rest/database
//     final url =
//         "https://${component.projectId}.firebaseio.com/sponsors/conference_year/2023/${component.category}.json";
//     final resp = await http.get(Uri.parse(url));
//     final data = json.decode(resp.body);
//     var dataFiltered = (data as List).nonNulls.toList();

//     return [
//       ...(dataFiltered) //
//           .cast<Map<String, dynamic>>()
//           .map(ChallengeItem.fromJson),
//     ];
//   }

//   @override
//   Iterable<Component> build(BuildContext context) sync* {
//     yield Row(children: [
//       FutureBuilder<List<ChallengeItem>>(
//         initialData: <ChallengeItem>[],
//         future: _futureChallengeItems,
//         builder: (BuildContext context,
//             AsyncSnapshot<List<ChallengeItem>> snapshot) sync* {
//           for (final (index, item) in snapshot.requireData.indexed) {
//             yield div([
//       p([
//         text(
//          item.description
//         ),
//         a(
//           href: item.reference_link,
//           target: Target.blank,
//           [text('Robert Felker\'s Flutter art')],
//         ),
//         text('.'),
//       ]),
//       p([
//         text('The winning entry will be selected based on creativity, aesthetics, code organization, code quality, '
//             'and overall execution. Find submission guidelines and the entry form at the link below.'),
//       ]),
//       p([
//         text('Submissions are due by 10 November at 1:00AM PST.'),
//       ]),
//       p([
//         a(
//           classes: ['hero-button'],
//           href: 'https://docs.google.com/forms/d/e/1FAIpQLSe5pS0_1_lKhskyIQHFgpq2gxNlkSguRn5jPdN7HSVaa3JD_A/viewform',
//           target: Target.blank,
//           [text('Get started!')],
//         ),
//       ])
//     ]);
//     yield div(classes: ['code-challenge-image'], [img(src: '/images/code_challenge_art.jpg')]);
//   }
//           }
//         },
//       )
//     ]);
//   }
// }

// class ChallengeItem {
//   const ChallengeItem({
//     // required this.conference_year,
//     required this.description,
//     required this.banner_img,
//     required this.due_date,
//     required this.google_form,
//   });

//   // final String conference_year;
//   final String banner_img;
//   final String description;
//   final String due_date;
//   final String google_form;
//   final String reference_link;
//   final List winner_details;
//   final String winning_prizes;

//   static ChallengeItem fromJson(Map<String, dynamic> json) {
//     return ChallengeItem(
//       // conference_year: json['conference_year'] as String,
//       banner_img: json['banner_img'] as String,
//       description: json['description'] as String,
//       due_date: json['due_date'] as String,
//       google_form: json['google_form'] as String,
//       // reference_link: json['reference_link'] as String,
//       // winner_details: json['winner_details'] as List,
//       // winning_prizes: json['winning_prizes'] as String,
//     );
//   }

//   @override
//   String toString() => 'SponsorItem{}';
// }
