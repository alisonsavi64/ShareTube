import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Text('Home')
          ],
        ),
      ),
    );
  }
}
