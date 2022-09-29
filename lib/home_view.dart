import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // the FAB
      floatingActionButton: IconButton(
        icon: const Icon(CupertinoIcons.add),
        onPressed: () {
          // go to the file addition page.
        },
      ),

      // The bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.list_dash)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.book))
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),

      
      // The main body
      body: ListView(),
    );
  }
}
