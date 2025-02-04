import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../theme/constants.dart';
import 'nav_pages/nav_add_report_page.dart';
import 'nav_pages/nav_home_page.dart';
import 'nav_pages/nav_profile_page.dart';
import 'nav_pages/nav_view_report_page.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
      const NavHomePage(),
      const NavViewReportpage(),
      const NavAddReportPage(),
      const NavProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Center(
            child: Image.asset(
              "assets/appbar_image.png",
              height: 40,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: GNav(
            gap: 10,
            padding: const EdgeInsets.all(12),
            color: kDarkBlueColor,
            activeColor: kBlueColor,
            duration: const Duration(milliseconds: 600),
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: const [
              GButton(
                backgroundColor: kBlueClairColor,
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                backgroundColor: kBlueClairColor,
                icon: Icons.insert_drive_file_outlined,
                text: "Report",
              ),
              GButton(
                backgroundColor: kBlueClairColor,
                icon: Icons.add,
                text: "Ajout",
              ),
              GButton(
                backgroundColor: kBlueClairColor,
                icon: Icons.person_outline_rounded,
                text: "Profil",
              ),
            ],
          ),
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}
