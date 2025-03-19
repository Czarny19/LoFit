import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:lofit/l10n/gen/app_localizations.dart';
import 'package:lofit/ui/constants/icons.dart' show backButtonIcon;

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({
    super.key,
    this.visible = true,
    this.actions = const [],
    this.backIconButtonVisible = false,
    this.backIconButtonAction,
  });

  final bool visible;

  final List<IconButton> actions;

  final bool backIconButtonVisible;

  final Function()? backIconButtonAction;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (!visible) {
      return const SizedBox(height: 0, width: 0);
    }

    return AppBar(
      title: Text(l10n.appName, style: GoogleFonts.plaster()),
      centerTitle: true,
      leading:
          backIconButtonVisible ? IconButton(onPressed: backIconButtonAction, icon: const Icon(backButtonIcon)) : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(0, 60);
}
