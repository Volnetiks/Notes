import 'package:flutter/material.dart';
import 'package:notes/database/database_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getNotes() async {
    final notes = await DatabaseProvider.db.getNotes();
    return notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notes")),
      body: FutureBuilder(
          future: getNotes(),
          builder: (context, AsyncSnapshot noteData) {
            switch (noteData.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                {
                  if (noteData.data == Null) {
                    return const Center(
                        child: Text("You don't have any notes."));
                  } else {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: noteData.data.length,
                            itemBuilder: (context, index) {
                              String title = noteData.data[index]['title'];
                              String body = noteData.data[index]['body'];
                              String date = noteData.data[index]['date'];
                              int id = noteData.data[index]['id'];

                              return Card(
                                  child: ListTile(
                                title: Text(
                                  title,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                  body,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ));
                            }));
                  }
                }
              default:
                return const Center(child: Text("You don't have any notes."));
            }
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/addNote");
          },
          child: const Icon(Icons.note_add)),
    );
  }
}
