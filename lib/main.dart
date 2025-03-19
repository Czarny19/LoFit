import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lofit/data/repositories/global_repository.dart';
import 'package:lofit/data/repositories/meals_repository.dart';
import 'package:lofit/data/repositories/recipes_repository.dart';
import 'package:lofit/data/repositories/tags_repository.dart';
import 'package:lofit/l10n/gen/app_localizations.dart';
import 'package:lofit/router/router.dart';
import 'package:lofit/ui/theme/light_theme.dart';

void main() {
  runApp(const LoFitApp());
}

class LoFitApp extends StatelessWidget {
  const LoFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => GlobalRepository()),
        RepositoryProvider(create: (context) => MealsRepository(context.read<GlobalRepository>().db)),
        RepositoryProvider(create: (context) => TagsRepository(context.read<GlobalRepository>().db)),
        RepositoryProvider(create: (context) => RecipesRepository(context.read<GlobalRepository>().db)),
      ],
      child: MaterialApp.router(
        title: 'LoFit',
        localizationsDelegates: [AppLocalizations.delegate],
        supportedLocales: const [Locale('en'), Locale('pl')],
        theme: lightThemeData,
        routerConfig: goRouter,
      ),
    );
  }
}
