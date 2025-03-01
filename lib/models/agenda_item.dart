class AgendaItem {
  const AgendaItem({
    required this.title,
    required this.speakers,
    required this.description,
    required this.time,
    required this.type,
  });

  final String title;
  final List speakers;
  final String description;
  final String type;
  final DateTime time;

  static AgendaItem fromJson(Map<String, dynamic> json) {
    return AgendaItem(
      title: json['title'] as String,
      speakers: json['speaker'] as List,
      description: json['description'] as String,
      time: DateTime.parse('2023-11-11 ${json['start_time']}z'),
      type: json['schedule_type'] as String,
    );
  }

  @override
  String toString() => 'AgendaItem{$title}';
}
