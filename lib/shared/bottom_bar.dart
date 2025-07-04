import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final int currentPageIndex;
  final Function(int) handleChangeNav;

  const BottomNavigation({
    super.key,
    required this.handleChangeNav,
    required this.currentPageIndex,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        backgroundColor: Colors.black,
        indicatorColor: Colors.grey[900],
        overlayColor: WidgetStatePropertyAll(Colors.grey[900]),
        labelTextStyle: WidgetStatePropertyAll(
          TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
      child: NavigationBar(
        surfaceTintColor: Colors.transparent,
        onDestinationSelected: (int index) {
          widget.handleChangeNav(index);
        },
        selectedIndex: widget.currentPageIndex,
        destinations:
            [
              {
                'icon': Icons.home_outlined,
                'selectedIcon': Icons.home,
                'label': 'Home',
              },
              {
                'icon': Icons.search_outlined,
                'selectedIcon': Icons.search,
                'label': 'Search',
              },
              {
                'icon': Icons.video_library_outlined,
                'selectedIcon': Icons.video_library,
                'label': 'Upcoming',
                'badgeCount': 4,
              },
              {
                'icon': Icons.download_outlined,
                'selectedIcon': Icons.download,
                'label': 'Downloads',
              },
              {
                'icon': Icons.account_circle_outlined,
                'selectedIcon': Icons.account_circle,
                'label': 'Profile',
              },
            ].map((destination) {
              return NavigationDestination(
                selectedIcon: destination.containsKey('badgeCount')
                    ? Badge.count(
                        count: destination['badgeCount'] as int,
                        child: Icon(
                          destination['selectedIcon'] as IconData?,
                          color: Colors.white,
                        ),
                      )
                    : Icon(
                        destination['selectedIcon'] as IconData?,
                        color: Colors.white,
                      ),
                icon: destination.containsKey('badgeCount')
                    ? Badge.count(
                        count: destination['badgeCount'] as int,
                        child: Icon(
                          destination['icon'] as IconData?,
                          color: Colors.white,
                        ),
                      )
                    : Icon(
                        destination['icon'] as IconData?,
                        color: Colors.white,
                      ),
                label: destination['label'] as String,
              );
            }).toList(),
      ),
    );
  }
}
