import 'package:flutter/material.dart';

/// Model representing a navigation item for [CustomNavigationBar].
///
/// Each [NavigationItem] defines the icon, selected icon, label, and an optional badge count
/// to be displayed in the navigation bar.
///
/// Example:
/// ```dart
/// NavigationItem(
///   icon: Icons.home_outlined,
///   selectedIcon: Icons.home,
///   label: 'Home',
///   badgeCount: 3,
/// )
/// ```
///
/// - [icon]: Icon to display when the item is not selected.
/// - [selectedIcon]: Icon to display when the item is selected.
/// - [label]: Label for the navigation item.
/// - [badgeCount]: Optional badge count to display on the item (e.g., for notifications).
class NavigationItem {
  /// The icon to display when the item is not selected.
  final IconData icon;

  /// The icon to display when the item is selected.
  final IconData selectedIcon;

  /// The label for the navigation item.
  final String label;

  /// Optional badge count to display on the item (e.g., for notifications).
  final int? badgeCount;

  /// Creates a [NavigationItem].
  ///
  /// [icon], [selectedIcon], and [label] are required.
  /// [badgeCount] is optional and can be used to show a badge on the item.
  const NavigationItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    this.badgeCount,
  });
}

/// A reusable bottom navigation bar supporting icons, labels, and optional badges.
///
/// Displays a list of [NavigationItem]s as navigation destinations.
/// The currently selected item is highlighted, and items can display a badge count if provided.
///
/// Example:
/// ```dart
/// CustomNavigationBar(
///   selectedIndex: 0,
///   handleChange: (index) => print('Selected: $index'),
///   navItems: [
///     NavigationItem(
///       icon: Icons.home_outlined,
///       selectedIcon: Icons.home,
///       label: 'Home',
///     ),
///     NavigationItem(
///       icon: Icons.search_outlined,
///       selectedIcon: Icons.search,
///       label: 'Search',
///     ),
///     NavigationItem(
///       icon: Icons.notifications_outlined,
///       selectedIcon: Icons.notifications,
///       label: 'Alerts',
///       badgeCount: 3,
///     ),
///   ],
/// )
/// ```
///
/// - [selectedIndex]: Index of the currently selected navigation item.
/// - [handleChange]: Callback when a navigation item is selected.
/// - [navItems]: List of [NavigationItem]s to display.
class CustomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final void Function(int) handleChange;
  final List<NavigationItem> navItems;

  const CustomNavigationBar({
    super.key,
    required this.handleChange,
    required this.selectedIndex,
    required this.navItems,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: widget.handleChange,
      selectedIndex: widget.selectedIndex,
      destinations: widget.navItems.map((destination) {
        Widget buildIcon(IconData icon) {
          if (destination.badgeCount != null) {
            return Badge.count(
              count: destination.badgeCount!,
              child: Icon(icon),
            );
          }
          return Icon(icon);
        }

        return NavigationDestination(
          selectedIcon: buildIcon(destination.selectedIcon),
          icon: buildIcon(destination.icon),
          label: destination.label,
        );
      }).toList(),
    );
  }
}
