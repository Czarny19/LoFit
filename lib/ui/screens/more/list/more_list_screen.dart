import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lofit/data/repositories/global_repository.dart';
import 'package:lofit/l10n/gen/app_localizations.dart';
import 'package:lofit/router/router.dart';
import 'package:lofit/ui/constants/icons.dart';
import 'package:lofit/ui/screens/more/list/bloc/more_list_bloc.dart';
import 'package:lofit/ui/widgets/divider/list_divider.dart';

class MoreListScreen extends StatelessWidget {
  const MoreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider<MoreListBloc>(
      create: (context) {
        return MoreListBloc(prefsRepository: RepositoryProvider.of<GlobalRepository>(context))..add(MoreListInit());
      },
      child: BlocBuilder<MoreListBloc, MoreListState>(
        buildWhen: (prev, curr) => prev.status != curr.status,
        builder: (context, state) {
          if (state.status == MoreListStatus.loading) {
            return const SizedBox();
          }

          final prefs = state.prefs;

          final options = [
            ListTile(
              title: Text(l10n.dailyIntakeNeeds),
              subtitle: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${prefs.dailyKcal} ${l10n.kcal}'),
                  Text('${l10n.proteinsShort} ${prefs.dailyProteins}g'),
                  Text('${l10n.fatsShort} ${prefs.dailyFats}g'),
                  Text('${l10n.carbsShort} ${prefs.dailyCarbs}g'),
                ],
              ),
              leading: Icon(kcalIcon),
              onTap: () => context.push(pathHomeMoreIntake),
            ),
            ListTile(
              title: Text(l10n.yourMeals),
              subtitle: Text(l10n.editYourMeals),
              leading: Icon(timeIcon),
              onTap: () => context.push(pathHomeMoreMeals),
            ),
          ];

          return ListView.separated(
            itemBuilder: (context, index) => options[index],
            separatorBuilder: (context, index) => const ListDivider(),
            itemCount: options.length,
          );
        },
      ),
    );
  }
}
