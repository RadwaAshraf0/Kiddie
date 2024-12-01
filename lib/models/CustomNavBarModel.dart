import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../Pages/Home_Pages/home_page.dart';
import '../Pages/Profile_Pages/profile_page.dart';
import '../Pages/setting_page.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  final PersistentTabController _controller;

  _CustomNavBarState() : _controller = PersistentTabController(initialIndex: 1);

  List<Widget> _buildScreens() {
    return [
      const ProfilePage(),
      const HomePage(),
      const SettingPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_3),
        title: ("Profile"),
        activeColorPrimary: const Color.fromARGB(255, 250, 207, 154),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: const Color.fromARGB(255, 250, 207, 154),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: ("Setting"),
        activeColorPrimary: const Color.fromARGB(255, 250, 207, 154),
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/firstPages/paper.jpg"), // Path to your image
                fit: BoxFit.cover, // Make the image cover the entire background
              ),
            ),
          ),
          // Main content
          PersistentTabView(
            context,
            
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineToSafeArea: true,
            backgroundColor: Colors.transparent, // Transparent to show the background image
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardAppears: true,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.transparent, 
              
            ),
            popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
            animationSettings: const NavBarAnimationSettings(
              navBarItemAnimation: ItemAnimationSettings(
                duration: Duration(milliseconds: 200),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: ScreenTransitionAnimationSettings(
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              ),
            ),
            navBarStyle: NavBarStyle.style19,  ),
        ],
      ),
    );
  }
}
