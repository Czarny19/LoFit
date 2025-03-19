part of '../welcome_screen.dart';

class _WelcomeForm extends StatelessWidget {
  _WelcomeForm();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(paddingMd),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextInput(
                label: l10n.yourName,
                initialValue: '',
                validator: (value) => (value == null || value.isEmpty) ? l10n.fieldRequired : null,
                onValueChange: (value) => context.read<WelcomeBloc>().add(WelcomeUpdatedUserName(value)),
              ),
              const Padding(padding: EdgeInsets.only(bottom: paddingMd)),
              InfoCard(msg: l10n.welcomeSettingsInfo),
              const Padding(padding: EdgeInsets.only(bottom: paddingMd)),
              BlocBuilder<WelcomeBloc, WelcomeState>(
                buildWhen: (prev, curr) => prev.newPrefs != curr.newPrefs,
                builder: (context, state) {
                  return DailyIntake(
                    prefs: state.newPrefs,
                    onKcalChange: (value) => context.read<WelcomeBloc>().add(WelcomeUpdatedKcal(value)),
                    onProteinsChange: (value) => context.read<WelcomeBloc>().add(WelcomeUpdatedProteins(value)),
                    onFatsChange: (value) => context.read<WelcomeBloc>().add(WelcomeUpdatedFats(value)),
                    onCarbsChange: (value) => context.read<WelcomeBloc>().add(WelcomeUpdatedCarbs(value)),
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(bottom: paddingMd)),
              BlocBuilder<WelcomeBloc, WelcomeState>(
                buildWhen: (prev, curr) => prev.newPrefs.totalPercentage != curr.newPrefs.totalPercentage,
                builder: (context, state) {
                  return FullWidthButton(
                    label: l10n.confirm,
                    enabled: state.newPrefs.totalPercentage == 100,
                    onClick: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<WelcomeBloc>().add(WelcomeFormSaved(l10n: l10n));
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
