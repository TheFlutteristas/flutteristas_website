class SpeakerItem {
  const SpeakerItem({
    // required this.conference_year,
    required this.name,
    required this.bio,
    required this.photoLink,
    required this.professionalRole,
    required this.socialMedia,
    required this.titleTalk,
    // required this.titleDesription,
    // required this.titleTime
  });

  // final String conference_year;
  final String name;
  final String bio;
  final String photoLink;
  final String professionalRole;
  final Map socialMedia;
  final String titleTalk;
  // final String titleDesription;
  // final DateTime titleTime;

  static SpeakerItem fromJson(Map<String, dynamic> json) {
    return SpeakerItem(
      // conference_year: json['conference_year'] as String,
      name: json['name'] as String,
      bio: json['bio'] as String,
      photoLink: json['photo'] as String,
      socialMedia: json['socialmedia'] as Map,
      professionalRole: json['professional_role'] as String,
      titleTalk: json['talk_title'] as String,
      // titleDescription: json['talk_description'] as String,
      // titletime: json['talk_time'] as DateTime,
    );
  }

  @override
  String toString() => 'SpeakerItem{}';
}
