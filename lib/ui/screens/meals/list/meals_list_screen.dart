import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lofit/data/model/meal_model.dart';
import 'package:lofit/data/repositories/meals_repository.dart';
import 'package:lofit/l10n/gen/app_localizations.dart';
import 'package:lofit/ui/constants/icons.dart' show addIcon, calendarSelectIcon, nextIcon, prevIcon;
import 'package:lofit/ui/screens/meals/list/bloc/meals_list_bloc.dart';
import 'package:lofit/ui/widgets/bar/secondary_sliver_app_bar.dart';

part 'widget/meals_list_group_item.dart';

part 'widget/meals_list_top_bar.dart';

class MealsListScreen extends StatelessWidget {
  const MealsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider<MealsListBloc>(
      create: (context) => MealsListBloc(mealsRepository: context.read<MealsRepository>())..add(MealsListInit()),
      child: BlocBuilder<MealsListBloc, MealsListState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              const _MealsListTopBar(),
              ...state.meals.map((meal) => _MealsGroupItem(meal: meal)),
              _MealsGroupItem(meal: MealModel(id: -1, name: l10n.other, time: -1, isActive: true)),
            ],
          );
        },
      ),
    );
  }
}
