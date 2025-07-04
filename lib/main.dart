import 'package:flutter/material.dart';
import 'package:mkx/shared/bottom_bar.dart';
import 'package:mkx/screens/movie_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData get _darkTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF181818),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF181818),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 26,
        letterSpacing: 1.2,
      ),
    ),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
    drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFF181818)),
    cardColor: Colors.white10,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movieflix',
      debugShowCheckedModeBanner: false,
      theme: _darkTheme,
      darkTheme: _darkTheme,
      themeMode: ThemeMode.dark,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getScreenForIndex(_selectedIndex),
      bottomNavigationBar: BottomNavigation(
        currentPageIndex: _selectedIndex,
        handleChangeNav: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _getScreenForIndex(int index) {
    switch (index) {
      case 0:
        return MovieListScreen();
      case 1:
        return Center(
          child: Text('Search', style: TextStyle(color: Colors.white)),
        );
      case 2:
        return Center(
          child: Text('Upcoming', style: TextStyle(color: Colors.white)),
        );
      case 3:
        return Center(
          child: Text('Downloads', style: TextStyle(color: Colors.white)),
        );
      case 4:
        return Center(
          child: Text('Settings', style: TextStyle(color: Colors.white)),
        );
      default:
        return MovieListScreen();
    }
  }
}
