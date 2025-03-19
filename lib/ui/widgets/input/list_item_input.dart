import 'package:flutter/material.dart';

class ListItemInput extends StatelessWidget {
  const ListItemInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
        hintText: 'meal',
        fillColor: theme.colorScheme.surface,
        filled: true,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        counterText: '',
      ),
      maxLength: 24,
      style: theme.textTheme.bodySmall,
      onChanged: (value) {},
    );
  }
}
