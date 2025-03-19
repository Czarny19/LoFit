import 'package:flutter/material.dart';
import 'package:lofit/ui/constants/dimens.dart' show iconSizeButton;
import 'package:lofit/ui/constants/icons.dart' show editIcon;

class IconEditButton extends StatelessWidget {
  const IconEditButton({super.key, required this.onClick});

  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      visualDensity: VisualDensity.compact,
      iconSize: iconSizeButton,
      onPressed: onClick,
      icon: Icon(editIcon, color: theme.colorScheme.onPrimary),
      style: IconButton.styleFrom(backgroundColor: theme.colorScheme.primary),
    );
  }
}
