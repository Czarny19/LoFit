import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lofit/data/model/meal_model.dart';
import 'package:lofit/data/repositories/meals_repository.dart';
import 'package:lofit/l10n/gen/app_localizations.dart';
import 'package:lofit/ui/constants/dimens.dart' show iconSizeMd, paddingSm;
import 'package:lofit/ui/constants/icons.dart' show addIcon, timeIcon;
import 'package:lofit/ui/screens/more/config/meals/bloc/meals_config_bloc.dart';
import 'package:lofit/ui/widgets/bar/secondary_sliver_app_bar.dart';
import 'package:lofit/ui/widgets/loading/app_loading.dart';

part 'widget/meals_config_item.dart';

part 'widget/meals_config_top_bar.dart';

class MealsConfigScreen extends StatelessWidget {
  const MealsConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider<MealsConfigBloc>(
      create: (context) => MealsConfigBloc(mealsRepository: context.read<MealsRepository>())..add(MealsConfigInit()),
      child: BlocConsumer<MealsConfigBloc, MealsConfigState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status == MealsConfigStatus.loading) {
            return const AppLoading();
          }

          return CustomScrollView(
            slivers: [
              const _MealsConfigTopBar(),
              if (state.meals.isEmpty)
                SliverToBoxAdapter(
                  child: Text(l10n.addMeal, textAlign: TextAlign.center, style: theme.textTheme.bodySmall),
                ),
              // TODO use sliverlist
              ...state.meals.map(
                (meal) => _MealsConfigItem(
                  item: meal,
                  onActiveClick: (checked) {},
                  onDeleteClick: () => {},
                  onEditClick: () => {},
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
