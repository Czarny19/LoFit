import 'package:flutter/material.dart';
import 'package:lofit/ui/constants/dimens.dart' show fullWidthButtonMargin;

class FullWidthButton extends StatelessWidget {
  const FullWidthButton({super.key, required this.label, required this.onClick, this.enabled = true});

  final String label;

  final bool enabled;

  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - fullWidthButtonMargin,
      child: ElevatedButton(onPressed: enabled ? onClick : null, child: Text(label)),
    );
  }
}
