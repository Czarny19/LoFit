import 'package:flutter/material.dart';
import 'package:lofit/ui/constants/dimens.dart' show iconSizeButton;
import 'package:lofit/ui/constants/icons.dart' show deleteIcon;

class IconDeleteButton extends StatelessWidget {
  const IconDeleteButton({super.key, required this.onClick});

  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      visualDensity: VisualDensity.compact,
      iconSize: iconSizeButton,
      onPressed: onClick,
      icon: Icon(deleteIcon, color: theme.colorScheme.onError),
      style: IconButton.styleFrom(backgroundColor: theme.colorScheme.error),
    );
  }
}
