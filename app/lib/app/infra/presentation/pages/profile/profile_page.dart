import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            Text('Profile')
          ],
        ),
      ),
    );
  }
}
