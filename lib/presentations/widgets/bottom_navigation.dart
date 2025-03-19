import 'package:flutter/material.dart';
import 'package:planet_defender/gen/assets.gen.dart';
import 'package:planet_defender/presentations/pages/home/home.page.dart';

class BottomNavigationApp extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  const BottomNavigationApp(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  State<BottomNavigationApp> createState() => _BottomNavigationAppState();
}

class _BottomNavigationAppState extends State<BottomNavigationApp> {
  String _iconHome() {
    return widget.selectedIndex == 0 ? Assets.svg.homeSelect : Assets.svg.home;
  }

  String _iconBook() {
    return widget.selectedIndex == 1
        ? Assets.svg.documentSelect
        : Assets.svg.document;
  }

  String _iconShop() {
    return widget.selectedIndex == 2 ? Assets.svg.buySelect : Assets.svg.buy;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.images.navigationBar.path),
              fit: BoxFit.fill)),
      child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
                icon: ItemBottomNavigation(
                    icon: _iconHome(),
                    currentIndex: widget.selectedIndex,
                    itemIndex: 0,
                    label: 'Home'),
                label: ''),
            BottomNavigationBarItem(
                icon: ItemBottomNavigation(
                    icon: _iconBook(),
                    currentIndex: widget.selectedIndex,
                    itemIndex: 1,
                    label: 'Book'),
                label: ''),
            BottomNavigationBarItem(
                icon: ItemBottomNavigation(
                    icon: _iconShop(),
                    currentIndex: widget.selectedIndex,
                    itemIndex: 2,
                    label: 'Shop'),
                label: ''),
          ],
          currentIndex: widget.selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (value) => widget.onItemTapped(value)),
    );
  }
}
