class OrganizerItem {
  const OrganizerItem({
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.photoLink,
    required this.professionalRole,
    required this.company,
    required this.socialMedia,
  });

  final String firstName;
  final String lastName;
  final String bio;
  final String photoLink;
  final String professionalRole;
  final Map socialMedia;
  final String company;

  static OrganizerItem fromJson(Map<String, dynamic> json) {
    return OrganizerItem(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      bio: json['bio'] as String,
      photoLink: json['photo'] as String,
      socialMedia: json['socialmedia'] as Map,
      professionalRole: json['role'] as String,
      company: json['company_name'] as String,
    );
  }

  @override
  String toString() => 'OrganizerItem{$firstName $lastName}';
}
