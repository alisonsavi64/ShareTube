import 'dart:io';
import 'package:flutter/material.dart';

class BuildNavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const BuildNavBar({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: 16, right: 16, bottom: Platform.isAndroid ? 16 : 0),
      child: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 70,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                navItem(
                    icon: Icons.home,
                    selected: pageIndex == 0,
                    label: 'Home',
                    onTap: () => onTap(0)),
                navItem(
                    icon: Icons.stacked_bar_chart_outlined,
                    selected: pageIndex == 1,
                    label: 'Library',
                    onTap: () => onTap(1)),
                navCentralItem(icon: Icons.add, onTap: () => debugPrint('Add')),
                navItem(
                    icon: Icons.person_2_outlined,
                    selected: pageIndex == 2,
                    label: 'Profile',
                    onTap: () => onTap(2)),
                navItem(
                    icon: Icons.heart_broken,
                    selected: pageIndex == 3,
                    label: 'Favorites',
                    onTap: () => debugPrint('Favorites'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navItem({
    required IconData icon,
    required bool selected,
    required String label,
    Function()? onTap,
  }) {
    return Expanded(
        child: InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            height: 6,
          ),
          Icon(
            icon,
            size: 26,
            color: selected ? Colors.red : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
                color: selected ? Colors.red : Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    ));
  }

  Widget navCentralItem({required IconData icon, Function()? onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          height: 60,
          width: 60,
          decoration:
              const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          child: Icon(icon, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}
