import 'package:flutter/material.dart';
import 'package:lofit/ui/constants/dimens.dart' show paddingMd;

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.msg});

  final String msg;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(paddingMd),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [const Icon(Icons.info_outline), const SizedBox(width: paddingMd), Flexible(child: Text(msg))],
        ),
      ),
    );
  }
}
