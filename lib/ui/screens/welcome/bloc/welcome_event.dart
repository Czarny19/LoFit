part of 'welcome_bloc.dart';

@immutable
sealed class WelcomeEvent {
  const WelcomeEvent();
}

class WelcomeInit extends WelcomeEvent {}

class WelcomeStarted extends WelcomeEvent {}

class WelcomeUpdatedUserName extends WelcomeEvent {
  const WelcomeUpdatedUserName(this.userName);

  final String userName;
}

class WelcomeUpdatedKcal extends WelcomeEvent {
  const WelcomeUpdatedKcal(this.kcal);

  final int kcal;
}

class WelcomeUpdatedProteins extends WelcomeEvent {
  const WelcomeUpdatedProteins(this.proteins);

  final int proteins;
}

class WelcomeUpdatedCarbs extends WelcomeEvent {
  const WelcomeUpdatedCarbs(this.carbs);

  final int carbs;
}

class WelcomeUpdatedFats extends WelcomeEvent {
  const WelcomeUpdatedFats(this.fats);

  final int fats;
}

class WelcomeFormSaved extends WelcomeEvent {
  const WelcomeFormSaved({required this.l10n});

  final AppLocalizations l10n;
}
