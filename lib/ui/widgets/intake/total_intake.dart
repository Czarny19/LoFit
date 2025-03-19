import 'package:flutter/material.dart';
import 'package:lofit/l10n/gen/app_localizations.dart';
import 'package:lofit/ui/constants/dimens.dart' show iconSizeXl, paddingMd;
import 'package:lofit/ui/constants/icons.dart';

class TotalIntake extends StatefulWidget {
  const TotalIntake({super.key, required this.totalPercentage});

  final int totalPercentage;

  @override
  State<TotalIntake> createState() => _TotalIntakeState();
}

class _TotalIntakeState extends State<TotalIntake> {
  final valueController = TextEditingController();

  @override
  void dispose() {
    valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    valueController.text = widget.totalPercentage.toString();

    return Row(
      children: [
        Icon(totalIntakeIcon, size: iconSizeXl, color: theme.colorScheme.primary),
        Padding(padding: EdgeInsets.only(left: paddingMd)),
        Text(l10n.total, textAlign: TextAlign.start, style: theme.textTheme.labelLarge),
        Spacer(),
        SizedBox(
          width: 72.0,
          child: TextFormField(
            controller: valueController,
            readOnly: true,
            enabled: false,
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(),
              fillColor: theme.colorScheme.primaryContainer,
              filled: true,
              suffixText: '%',
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: paddingMd)),
        SizedBox(width: 112.0),
      ],
    );
  }
}
