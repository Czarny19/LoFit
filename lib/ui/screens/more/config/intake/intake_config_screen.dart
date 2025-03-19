import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lofit/data/repositories/global_repository.dart';
import 'package:lofit/l10n/gen/app_localizations.dart';
import 'package:lofit/ui/constants/dimens.dart' show paddingMd;
import 'package:lofit/ui/screens/more/config/intake/bloc/intake_config_bloc.dart';
import 'package:lofit/ui/widgets/button/full_width_button.dart';
import 'package:lofit/ui/widgets/intake/daily_intake.dart';
import 'package:lofit/ui/widgets/loading/app_loading.dart';

class IntakeConfigScreen extends StatelessWidget {
  const IntakeConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) {
        return IntakeConfigBloc(prefsRepository: RepositoryProvider.of<GlobalRepository>(context))
          ..add(IntakeConfigInit());
      },
      child: BlocConsumer<IntakeConfigBloc, IntakeConfigState>(
        listener: (context, state) {
          if (state.status == IntakeConfigStatus.finished) {
            context.pop();
          }
        },
        builder: (context, state) {
          if (state.status == IntakeConfigStatus.loading) {
            return const AppLoading();
          }

          if (state.status == IntakeConfigStatus.saving) {
            return AppLoading(label: l10n.saving);
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(paddingMd),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DailyIntake(
                    prefs: state.prefs,
                    onKcalChange: (value) => context.read<IntakeConfigBloc>().add(IntakeConfigUpdatedKcal(value)),
                    onProteinsChange:
                        (value) => context.read<IntakeConfigBloc>().add(IntakeConfigUpdatedProteins(value)),
                    onFatsChange: (value) => context.read<IntakeConfigBloc>().add(IntakeConfigUpdatedFats(value)),
                    onCarbsChange: (value) => context.read<IntakeConfigBloc>().add(IntakeConfigUpdatedCarbs(value)),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: paddingMd)),
                  FullWidthButton(
                    label: l10n.save,
                    enabled: state.prefs.totalPercentage == 100,
                    onClick: () => context.read<IntakeConfigBloc>().add(IntakeConfigSaved()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
