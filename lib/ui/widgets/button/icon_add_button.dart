import 'package:flutter/material.dart';
import 'package:lofit/ui/constants/dimens.dart' show iconSizeButton;
import 'package:lofit/ui/constants/icons.dart' show addIcon;

class IconAddButton extends StatelessWidget {
  const IconAddButton({super.key, required this.onClick});

  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      visualDensity: VisualDensity.comfortable,
      iconSize: iconSizeButton,
      onPressed: onClick,
      icon: Icon(addIcon, color: theme.colorScheme.onPrimaryContainer),
      style: IconButton.styleFrom(backgroundColor: theme.colorScheme.primaryContainer),
    );
  }
}
