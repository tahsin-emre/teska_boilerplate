import 'package:flutter/material.dart';
import 'package:teska_boilerplate/product/utils/extensions/teska_context_ext.dart';

final class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: context.teska.theme.primaryColor,
    );
  }
}
