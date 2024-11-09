import 'package:flutter/material.dart';

class BuildDrawerMenu extends StatelessWidget {
  final Function(int) onSelectItem;
  final int currentIndex;

  const BuildDrawerMenu(
      {super.key, required this.onSelectItem, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Drawer(
      width: mediaQuery.size.width * 0.65,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          SizedBox(height: mediaQuery.size.height * 0.15),
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                tileColor: currentIndex == 0 ? Colors.red : Colors.white,
                leading: Icon(Icons.stacked_bar_chart,
                    color: currentIndex == 0 ? Colors.red : Colors.grey),
                trailing: Icon(currentIndex == 0 ? Icons.arrow_back_ios_rounded : Icons.arrow_forward_ios_rounded, color: currentIndex == 0 ? Colors.red : Colors.grey,size: 18),
                title: const Text('Library'),
                onTap: () {
                  onSelectItem(1);
                  Navigator.pop(context);
                },
              ),
                            ListTile(
                tileColor: currentIndex == 1 ? Colors.red : Colors.white,
                leading: Icon(Icons.home,
                    color: currentIndex == 1 ? Colors.red : Colors.grey),
                trailing: Icon(currentIndex == 1 ? Icons.arrow_back_ios_rounded : Icons.arrow_forward_ios_rounded, color: currentIndex == 1 ? Colors.red : Colors.grey,size: 18),
                title: const Text('Home'),
                onTap: () {
                  onSelectItem(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                tileColor: currentIndex == 2 ? Colors.red : Colors.white,
                leading: Icon(Icons.home,
                    color: currentIndex == 2 ? Colors.red : Colors.grey),
                trailing: Icon(currentIndex == 2 ? Icons.arrow_back_ios_rounded : Icons.arrow_forward_ios_rounded, color: currentIndex == 2 ? Colors.red : Colors.grey,size: 18),
                title: const Text('Profile'),
                onTap: () {
                  onSelectItem(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
