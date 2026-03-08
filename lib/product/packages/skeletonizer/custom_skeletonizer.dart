import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

final class CustomSkeletonizer extends StatelessWidget {
  const CustomSkeletonizer({
    required this.child,
    required this.isLoading,
    super.key,
  });
  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(enabled: isLoading, child: child);
  }
}
