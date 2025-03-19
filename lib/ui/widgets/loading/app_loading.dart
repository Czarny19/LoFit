import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:lofit/l10n/gen/app_localizations.dart';
import 'package:lofit/ui/constants/dimens.dart' show iconSizeXxl, paddingXl;
import 'package:lofit/ui/constants/icons.dart' show appIcon;

class AppLoading extends StatefulWidget {
  const AppLoading({super.key, this.label});

  final String? label;

  @override
  AppLoadingState createState() => AppLoadingState();
}

class AppLoadingState extends State<AppLoading> {
  bool _animationStarted = false;
  double _turns = 0.0;
  Timer? _timer;

  @override
  void dispose() {
    _turns = 0.0;
    _animationStarted = false;
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_animationStarted) {
        setState(() => _turns += 1.0);
        _timer = Timer.periodic(const Duration(seconds: 2), (Timer t) => setState(() => _turns += 1.0));
        _animationStarted = true;
      }
    });

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedRotation(
            turns: _turns,
            duration: const Duration(seconds: 2),
            child: Icon(appIcon, size: iconSizeXxl, color: theme.colorScheme.primary),
          ),
          Padding(
            padding: EdgeInsets.only(top: paddingXl),
            child: Text(
              widget.label ?? l10n.loading,
              style: theme.textTheme.titleLarge!.copyWith(color: theme.colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
