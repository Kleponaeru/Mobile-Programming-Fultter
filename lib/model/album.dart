class Album {
  final int id;
  final String title;

  const Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id') && json.containsKey('title')) {
      return Album(
        id: json['id'] as int,
        title: json['title'] as String,
      );
    } else {
      throw FormatException('Failed to load album.');
    }
  }
}
