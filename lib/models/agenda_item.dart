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
  final String time;

  static AgendaItem fromJson(Map<String, dynamic> json) {
    return AgendaItem(
      title: json['title'] as String,
      speakers: json['speaker'] as List,
      description: json['description'] as String,
      time: json['start_time'] as String,
      type: json['schedule_type'] as String,
    );
  }

  @override
  String toString() => 'AgendaItem{$title}';
}
