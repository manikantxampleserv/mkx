import 'package:flutter/material.dart';

/// A custom [SliverGridDelegateWithFixedCrossAxisCount] for use with GridView.
///
/// This delegate allows you to specify the number of columns, the main axis spacing,
/// and the child aspect ratio. The cross axis spacing is set to the same value as
/// the main axis spacing by default.
///
/// Example usage:
/// ```dart
/// GridView(
///   gridDelegate: SilverDelegate(crossAxisCount: 3),
///   children: [ ... ],
/// )
/// ```
class SilverDelegate extends SliverGridDelegateWithFixedCrossAxisCount {
  /// Creates a [SilverDelegate].
  ///
  /// The [crossAxisCount] argument must not be null.
  /// The [mainAxisSpacing] defaults to 16.
  /// The [childAspectRatio] defaults to 0.7.
  SilverDelegate({
    required super.crossAxisCount,
    super.mainAxisSpacing = 16,
    super.childAspectRatio = 0.7,
  }) : super(crossAxisSpacing: mainAxisSpacing);
}
