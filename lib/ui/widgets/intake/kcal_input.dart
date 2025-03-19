import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter;
import 'package:lofit/l10n/gen/app_localizations.dart';
import 'package:lofit/ui/constants/dimens.dart' show iconSizeXl, paddingMd;
import 'package:lofit/ui/constants/icons.dart' show kcalIcon;

class KcalInput extends StatefulWidget {
  const KcalInput({super.key, required this.initialValue, required this.onValueChange});

  final int initialValue;

  final Function(int) onValueChange;

  @override
  State<KcalInput> createState() => _KcalInputState();
}

class _KcalInputState extends State<KcalInput> {
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

    valueController.text = widget.initialValue.toString();

    return Row(
      children: [
        Icon(kcalIcon, color: Colors.red, size: iconSizeXl),
        Padding(padding: EdgeInsets.only(left: paddingMd)),
        Text(l10n.energy, textAlign: TextAlign.start, style: theme.textTheme.labelLarge),
        Spacer(),
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
              suffixText: l10n.kcal,
            ),
            onChanged: (value) => widget.onValueChange.call(value.isEmpty ? 0 : int.parse(value)),
          ),
        ),
      ],
    );
  }
}
