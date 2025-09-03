import 'package:flutter/material.dart';
import 'package:mkx/screens/movie_list_screen.dart';
import 'package:mkx/screens/search_screen.dart';
import 'package:mkx/screens/upcoming_screen.dart';
import 'package:mkx/screens/downloads_screen.dart';
import 'package:mkx/screens/profile_screen.dart';
import 'package:mkx/screens/splash_screen.dart';
import 'package:mkx/shared/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Global variable that will be accessible throughout the app
bool isDarkMode = false;

// Function to load the theme preference
Future<void> loadThemePreference() async {
  final prefs = await SharedPreferences.getInstance();
  isDarkMode = prefs.getBool('isDarkMode') ?? false;
}

// Function to save the theme preference
Future<void> saveThemePreference(bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isDarkMode', value);
}

// A global key that allows updating the theme from anywhere
final appKey = GlobalKey<_MyAppState>();

// Function to update app theme
void updateAppTheme() {
  appKey.currentState?.updateTheme();
}

void main() async {
  // Ensure Flutter is initialized before using plugins
  WidgetsFlutterBinding.ensureInitialized();

  // Load theme preference at app startup
  await loadThemePreference();

  runApp(MyApp(key: appKey));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData get _darkTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.dark,
    ),
  );
  ThemeData get _lightTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.light,
    ),
  );

  // Update theme and trigger a rebuild
  void updateTheme() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movieflix',
      debugShowCheckedModeBanner: false,
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: SplashScreen(nextScreen: MainScreen()),
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
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        handleChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        navItems: [
          NavigationItem(
            icon: Icons.home_outlined,
            selectedIcon: Icons.home,
            label: 'Home',
          ),
          NavigationItem(
            icon: Icons.search_outlined,
            selectedIcon: Icons.search,
            label: 'Search',
          ),
          NavigationItem(
            icon: Icons.video_library_outlined,
            selectedIcon: Icons.video_library,
            label: 'Upcoming',
            badgeCount: 4,
          ),
          NavigationItem(
            icon: Icons.download_outlined,
            selectedIcon: Icons.download,
            label: 'Downloads',
          ),
          NavigationItem(
            icon: Icons.account_circle_outlined,
            selectedIcon: Icons.account_circle,
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _getScreenForIndex(int index) {
    switch (index) {
      case 0:
        return MovieListScreen();
      case 1:
        return SearchScreen();
      case 2:
        return UpcomingScreen();
      case 3:
        return DownloadsScreen();
      case 4:
        return ProfileScreen();
      default:
        return MovieListScreen();
    }
  }
}
