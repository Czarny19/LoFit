import 'package:flutter/material.dart';
import 'package:lofit/ui/constants/dimens.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        border: Border.all(color: theme.colorScheme.surfaceTint.withAlpha(128), style: BorderStyle.solid),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: paddingXs, horizontal: paddingMd),
        child: Text(
          text,
          style: theme.textTheme.titleSmall!.copyWith(letterSpacing: 0.8, color: theme.colorScheme.onSecondary),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
