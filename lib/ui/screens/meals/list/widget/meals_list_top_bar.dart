part of '../meals_list_screen.dart';

class _MealsListTopBar extends StatelessWidget {
  const _MealsListTopBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsListBloc, MealsListState>(
      buildWhen: (prev, curr) => prev.displayedDate != curr.displayedDate,
      builder: (context, state) {
        return SecondarySliverAppBar(
          title: DateFormat.MMMEd().format(state.displayedDate ?? DateTime.now()),
          actions: [
            IconButton(onPressed: () => _selectDate(context, state), icon: Icon(calendarSelectIcon)),
            IconButton(
              onPressed: () => context.read<MealsListBloc>().add(MealsListMovedToPrevDay()),
              icon: Icon(prevIcon),
            ),
            IconButton(
              onPressed: () => context.read<MealsListBloc>().add(MealsListMovedToNextDay()),
              icon: Icon(nextIcon),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context, MealsListState state) async {
    if (state.displayedDate == null) {
      return;
    }

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: state.displayedDate,
      firstDate: DateTime(state.displayedDate!.year - 5),
      lastDate: DateTime(state.displayedDate!.year + 5),
    );

    if (context.mounted && selectedDate != null) {
      context.read<MealsListBloc>().add(MealsListDateSelected(selectedDate));
    }
  }
}
