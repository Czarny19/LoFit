import 'package:flutter/material.dart';
import 'package:lofit/data/model/pref_model.dart';
import 'package:lofit/l10n/gen/app_localizations.dart';
import 'package:lofit/ui/constants/dimens.dart';
import 'package:lofit/ui/widgets/intake/kcal_input.dart';
import 'package:lofit/ui/widgets/intake/macro_input.dart';
import 'package:lofit/ui/widgets/intake/total_intake.dart';
import 'package:lofit/ui/widgets/text/header.dart';

class DailyIntake extends StatelessWidget {
  const DailyIntake({
    super.key,
    required this.prefs,
    required this.onKcalChange,
    required this.onProteinsChange,
    required this.onFatsChange,
    required this.onCarbsChange,
  });

  final PrefModel prefs;

  final Function(int) onKcalChange;
  final Function(int) onProteinsChange;
  final Function(int) onFatsChange;
  final Function(int) onCarbsChange;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width, child: Header(text: l10n.dailyIntakeNeeds)),
        const SizedBox(height: paddingSm),
        Card(
          child: Padding(
            padding: EdgeInsets.all(paddingSm),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KcalInput(initialValue: prefs.dailyKcal, onValueChange: onKcalChange),
                Padding(padding: EdgeInsets.only(bottom: paddingMd)),
                MacroInput(
                  macroType: MacroType.proteins,
                  initialValue: prefs.dailyProteins,
                  kcal: prefs.dailyKcal,
                  onValueChange: onProteinsChange,
                ),
                Padding(padding: EdgeInsets.only(bottom: paddingMd)),
                MacroInput(
                  macroType: MacroType.fats,
                  initialValue: prefs.dailyFats,
                  kcal: prefs.dailyKcal,
                  onValueChange: onFatsChange,
                ),
                Padding(padding: EdgeInsets.only(bottom: paddingMd)),
                MacroInput(
                  macroType: MacroType.carbs,
                  initialValue: prefs.dailyCarbs,
                  kcal: prefs.dailyKcal,
                  onValueChange: onCarbsChange,
                ),
                Padding(padding: EdgeInsets.only(bottom: paddingMd)),
                TotalIntake(totalPercentage: prefs.totalPercentage),
                Padding(padding: EdgeInsets.only(bottom: paddingMd)),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    l10n.dailyIntakeNeedsInfo,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: prefs.totalPercentage != 100 ? theme.colorScheme.error : theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
