import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawbook/constants/color_palette.dart';
import 'package:lawbook/services/auth_services.dart';
import 'package:lawbook/utils/tools.dart';
import 'package:lawbook/views/UI/add_case.dart';
import 'package:lawbook/views/UI/organization/create_organization.dart';
import 'package:lawbook/views/UI/read_page.dart';
import 'package:lawbook/views/UI/view_case.dart';
import 'package:lawbook/views/onboard/onboard.dart';
import 'package:lawbook/widgets/custom_widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  List pages = const [CaseView(), OrganizationCreationPage(), ReadPage()];

  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;
    // final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      // key
      key: scaffoldKey,

      // the FAB
      floatingActionButton: currentIndex == 2
          ? null
          : FloatingActionButton(
              elevation: 0,
              backgroundColor: ColorPalette().primaryGreen,
              child: const Icon(
                color: Colors.white,
                Icons.create_new_folder_outlined,
              ),
              onPressed: () {
                // go to the file addition page.
                CustomWidget().moveToPage(
                    page: CasePage(isEdit: false),
                    context: context,
                    replacement: false);
              },
            ),

      // rtabi
      resizeToAvoidBottomInset: true,

      // the appbar
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        title: const Text(
          'Lawbook',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
// open dtawerA
              var res = AuthServices().signUserOut();
              if (res == '1') {
                Navigator.pop(context);
                Tools().popRouteUntilRoot(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (contxt) {
                  return const Onboard();
                }));
              }
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),

      // drawer
      drawer: Drawer(),

      // bg color
      backgroundColor: ColorPalette().backgroundColor,

      // The bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        currentIndex: currentIndex,
        items: const [
          // the list view tab
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.dashboard_rounded,
              ),
              icon: Icon(
                Icons.dashboard_outlined,
              ),
              label: 'Cases'),

          // The organization tab
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.group_rounded,
            ),
            icon: Icon(Icons.group_outlined),
            label: 'Organization',
          ),

          // the read page
          BottomNavigationBarItem(
              activeIcon: Icon(
                CupertinoIcons.book_fill,
              ),
              icon: Icon(
                CupertinoIcons.book,
              ),
              label: 'Read & Info'),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),

      // The main body
      body: pages[currentIndex],
    );
  }
}
