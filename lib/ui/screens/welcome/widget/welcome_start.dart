part of '../welcome_screen.dart';

class _WelcomeStart extends StatelessWidget {
  const _WelcomeStart();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(paddingMd),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(appIcon, size: iconSizeXxl, color: theme.colorScheme.primary),
          HeadlineLarge(text: l10n.welcomeMsg),
          Padding(
            padding: const EdgeInsets.all(paddingMd),
            child: Text(l10n.welcomeInfo, style: theme.textTheme.bodyLarge, textAlign: TextAlign.center),
          ),
          const SizedBox(height: paddingXl),
          FullWidthButton(label: l10n.welcomeStart, onClick: () => context.read<WelcomeBloc>().add(WelcomeStarted())),
        ],
      ),
    );
  }
}
