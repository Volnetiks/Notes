import 'package:flutter/material.dart';
import 'package:notes/screens/add_note_screen.dart';
import 'package:notes/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "/addNote": (context) => AddNoteScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
