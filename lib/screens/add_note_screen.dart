import 'package:flutter/material.dart';
import 'package:notes/database/database_provider.dart';

import '../models/note.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  String title = "";
  String body = "";
  late DateTime date;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Note")),
      body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 12.0,
          ),
          child: Column(children: [
            TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Note Title",
                ),
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold)),
            Expanded(
                child: TextField(
                    controller: _bodyController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Note Text")))
          ])),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            DatabaseProvider.db.addNewNote(Note(
                title: _titleController.text,
                body: _bodyController.text,
                date: DateTime.now()));

            Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
          },
          label: const Text("Save Note"),
          icon: const Icon(Icons.save)),
    );
  }
}
