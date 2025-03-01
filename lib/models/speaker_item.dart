class SpeakerItem {
  const SpeakerItem({
    required this.name,
    required this.bio,
    required this.photoLink,
    required this.professionalRole,
    required this.socialMedia,
    required this.titleTalk,
  });

  final String name;
  final String bio;
  final String photoLink;
  final String professionalRole;
  final Map socialMedia;
  final String titleTalk;

  static SpeakerItem fromJson(Map<String, dynamic> json) {
    return SpeakerItem(
      name: json['name'] as String,
      bio: json['bio'] as String,
      photoLink: json['photo'] as String,
      socialMedia: json['socialmedia'] as Map,
      professionalRole: json['professional_role'] as String,
      titleTalk: json['talk_title'] as String,
    );
  }

  @override
  String toString() => 'SpeakerItem{$name}';
}
