class Note {
  int? id;
  final String body;
  final String title;
  final DateTime date;

  Note({required this.body, required this.title, required this.date, this.id});

  Map<String, dynamic> toMap() {
    return ({"id": id, "title": title, "body": body, "date": date.toString()});
  }
}
