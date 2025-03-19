import 'package:flutter/material.dart';
import 'package:lofit/ui/widgets/text/header.dart';

class SecondarySliverAppBar extends StatelessWidget {
  const SecondarySliverAppBar({super.key, required this.title, this.actions});

  final String title;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Header(text: title),
      actions: actions,
      primary: false,
      leading: const SizedBox(),
      leadingWidth: 0,
    );
  }
}
