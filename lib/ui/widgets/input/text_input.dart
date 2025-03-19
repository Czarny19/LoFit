import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputFormatter;

class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onValueChange,
    this.suffixText = '',
    this.inputType = TextInputType.text,
    this.inputFormatters = const [],
    this.validator,
  });

  final String? label;

  final String initialValue;

  final Function(String) onValueChange;

  final String suffixText;

  final TextInputType inputType;

  final List<TextInputFormatter> inputFormatters;

  final FormFieldValidator<String>? validator;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final valueController = TextEditingController();

  @override
  void dispose() {
    valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    valueController.text = widget.initialValue;

    return TextFormField(
      controller: valueController,
      keyboardType: widget.inputType,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      onChanged: widget.onValueChange,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.label,
        isDense: true,
        suffixText: widget.suffixText,
      ),
    );
  }
}
