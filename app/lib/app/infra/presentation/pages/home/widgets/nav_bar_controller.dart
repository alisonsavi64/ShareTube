import 'package:animations/animations.dart';
import 'package:app/app/infra/presentation/pages/home/home_page.dart';
import 'package:app/app/infra/presentation/pages/home/widgets/build_drawer_menu.dart';
import 'package:app/app/infra/presentation/pages/home/widgets/build_nav_bar.dart';
import 'package:app/app/infra/presentation/pages/home/widgets/nav_model.dart';
import 'package:app/app/infra/presentation/pages/library/library_page.dart';
import 'package:app/app/infra/presentation/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

class NavBarController extends StatefulWidget {
  const NavBarController({super.key});

  @override
  State<NavBarController> createState() => _NavBarControllerState();
}

class _NavBarControllerState extends State<NavBarController> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final libraryNavKey = GlobalKey<NavigatorState>();
  final accountNavKey = GlobalKey<NavigatorState>();
  int selectedNavBarIndex = 0;
  List<NavModel> items = [];

  @override
  void initState() {
    super.initState();
    items = [
      NavModel(page: HomePage(), navKey: homeNavKey),
      NavModel(page: LibraryPage(), navKey: libraryNavKey),
      NavModel(page: ProfilePage(), navKey: accountNavKey)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool didPop) {
        if (items[selectedNavBarIndex].navKey.currentState?.canPop() ?? false) {
          items[selectedNavBarIndex].navKey.currentState?.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> primaryAnimation,
              Animation<double> secondaryAnimation) {
            return FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child);
          },
          child: Navigator(
            key: items[selectedNavBarIndex].navKey,
            onGenerateInitialRoutes: (navigator, initialRoute) {
              return [
                MaterialPageRoute(
                    builder: (context) => items[selectedNavBarIndex].page),
              ];
            },
          ),
        ),
        bottomNavigationBar: BuildNavBar(
          pageIndex: selectedNavBarIndex,
          onTap: (index) {
            if (index == selectedNavBarIndex) {
              items[index]
                  .navKey
                  .currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                selectedNavBarIndex = index;
              });
            }
          },
        ),
      ),
    );
  }
}
