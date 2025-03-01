class SponsorItem {
  const SponsorItem({
    required this.name,
    required this.logoLink,
    required this.website,
  });

  final String name;
  final String logoLink;
  final String website;

  static SponsorItem fromJson(Map<String, dynamic> json) {
    return SponsorItem(
      name: json['sponsor_name'] as String,
      logoLink: json['sponsor_logo'] as String,
      website: json['website'] as String,
    );
  }

  @override
  String toString() => 'SponsorItem{$name}';
}
