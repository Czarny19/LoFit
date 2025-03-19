part of '../meals_list_screen.dart';

class _MealsGroupItem extends StatelessWidget {
  const _MealsGroupItem({required this.meal});

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: ListTile(
        leading: meal.formattedTime != null ? Text(meal.formattedTime!, style: theme.textTheme.bodySmall) : null,
        title: Text(meal.name),
        subtitle: Text('TODO kcal'),
        trailing: IconButton(onPressed: () {}, icon: Icon(addIcon)),
      ),
    );
  }
}
