import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter;
import 'package:lofit/l10n/gen/app_localizations.dart';
import 'package:lofit/ui/constants/dimens.dart' show iconSizeXl, paddingMd;
import 'package:lofit/ui/constants/icons.dart';

enum MacroType { proteins, fats, carbs }

class MacroInput extends StatefulWidget {
  const MacroInput({
    super.key,
    required this.macroType,
    required this.initialValue,
    required this.kcal,
    required this.onValueChange,
  });

  final MacroType macroType;

  final int initialValue;

  final int kcal;

  final Function(int) onValueChange;

  @override
  State<MacroInput> createState() => _MacroInputState();
}

class _MacroInputState extends State<MacroInput> {
  final valueController = TextEditingController();
  final percentageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    valueController.text = widget.initialValue.toString();
    percentageController.text = _calcPercentage();

    valueController.addListener(() {
      if (valueController.text.isEmpty) {
        return;
      }

      percentageController.text = _calcPercentage();
    });
  }

  @override
  void dispose() {
    valueController.dispose();
    percentageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    valueController.text = widget.initialValue.toString();
    percentageController.text = _calcPercentage();

    return Row(
      children: [
        Icon(_icon, size: iconSizeXl, color: _color),
        Padding(padding: EdgeInsets.only(left: paddingMd)),
        Text(_label(l10n), textAlign: TextAlign.start, style: theme.textTheme.labelLarge),
        Spacer(),
        SizedBox(
          width: 72.0,
          child: TextFormField(
            controller: percentageController,
            readOnly: true,
            enabled: false,
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(),
              fillColor: theme.colorScheme.primaryContainer,
              filled: true,
              suffixText: '%',
            ),
            onChanged: (value) => widget.onValueChange.call(int.parse(value)),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: paddingMd)),
        SizedBox(
          width: 112.0,
          child: TextFormField(
            controller: valueController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(),
              fillColor: theme.colorScheme.primaryContainer,
              filled: true,
              suffixText: 'g',
            ),
            onChanged: (value) => widget.onValueChange.call(value.isEmpty ? 0 : int.parse(value)),
          ),
        ),
      ],
    );
  }

  String _calcPercentage() {
    if (valueController.text.isEmpty || widget.kcal < 100) {
      return '0';
    }

    final kcalPerGram = widget.macroType == MacroType.fats ? 9 : 4;
    return (((int.parse(valueController.text) * kcalPerGram) / widget.kcal) * 100).round().toString();
  }

  String _label(AppLocalizations l10n) => switch (widget.macroType) {
    MacroType.proteins => l10n.proteins,
    MacroType.fats => l10n.fats,
    MacroType.carbs => l10n.carbs,
  };

  IconData get _icon => switch (widget.macroType) {
    MacroType.proteins => proteinsIcon,
    MacroType.fats => fatsIcon,
    MacroType.carbs => carbsIcon,
  };

  Color get _color => switch (widget.macroType) {
    MacroType.proteins => Colors.grey,
    MacroType.fats => Colors.orangeAccent,
    MacroType.carbs => Colors.brown,
  };
}
