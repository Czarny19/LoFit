import 'package:flutter/material.dart';

class HeadlineLarge extends StatelessWidget {
  const HeadlineLarge({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      text,
      style: theme.textTheme.headlineLarge!.copyWith(color: theme.colorScheme.primary),
      textAlign: TextAlign.center,
    );
  }
}
