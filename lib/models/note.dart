class Note {
  final int id;
  final String body;
  final String title;
  final DateTime date;

  const Note(
      {required this.body,
      required this.title,
      required this.date,
      required this.id});

  Map<String, dynamic> toMap() {
    return ({"id": id, "title": title, "body": body, "date": date});
  }
}
