import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: ((context, int newIndex, _) {
          return BottomNavigationBar(
            onTap: ((indexvalue) {
              indexChangeNotifier.value = indexvalue;
            }),
            currentIndex: newIndex,
            elevation: 0,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: height / 27,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: height / 27,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_box_outlined,
                    size: height / 27,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bookmark_outlined,
                    size: height / 27,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                    size: height / 27,
                  ),
                  label: ""),
            ],
          );
        }));
  }
}
