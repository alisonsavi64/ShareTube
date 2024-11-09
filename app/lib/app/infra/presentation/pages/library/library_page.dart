import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: const EdgeInsets.only(
          top: 40,  
          right: 20,
          left: 20,
        ),
        child: Column(
          children: [
            Text('Library')
          ],
        ),
      ),
    );
  }
}
