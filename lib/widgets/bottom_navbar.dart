// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:remotelock/features/accueil.dart';
import 'package:remotelock/features/batterie.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPageIndex = 0;

  List<NavigationDestination> buildDestinations() {
    List<NavigationDestination> destinations = [
      const NavigationDestination(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          label: "Home"),
      const NavigationDestination(
          icon: Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
          label: "Profile"),
    ];

    return destinations;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(color: Colors.black, width: 1.5),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: [const Accueil(), const Baterie()][currentPageIndex],
            bottomNavigationBar: NavigationBar(
              // height: 40,
              destinations: buildDestinations(),
              selectedIndex: currentPageIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              // backgroundColor: Colors.grey,
              backgroundColor: Colors.transparent,
              animationDuration: const Duration(microseconds: 1000),
            ),
          ),
        ),
      ),
    );
  }
}
