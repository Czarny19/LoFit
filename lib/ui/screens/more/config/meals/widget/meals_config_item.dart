part of '../meals_config_screen.dart';

class _MealsConfigItem extends StatelessWidget {
  const _MealsConfigItem({
    required this.item,
    required this.onActiveClick,
    required this.onDeleteClick,
    required this.onEditClick,
  });

  final MealModel item;

  final Function(bool) onActiveClick;

  final Function() onDeleteClick;

  final Function() onEditClick;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: ListTile(
        leading: SizedBox(
          height: 24.0,
          width: 24.0,
          child: Checkbox(value: item.isActive, onChanged: (checked) => onActiveClick.call(checked ?? false)),
        ),
        title: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
            hintText: 'meal',
            fillColor: theme.colorScheme.surface,
            filled: true,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
            counterText: '',
          ),
          maxLength: 24,
          style: theme.textTheme.bodySmall,
          onChanged: (value) {},
        ),
        trailing: SizedBox(
          height: 40.0,
          child: Chip(
            label: Text(item.formattedTime ?? ''),
            avatar: Icon(timeIcon, size: iconSizeMd),
            color: WidgetStatePropertyAll<Color>(theme.colorScheme.surface),
          ),
        ),
      ),
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(paddingSm),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 24.0,
              width: 24.0,
              child: Checkbox(value: item.isActive, onChanged: (checked) => onActiveClick.call(checked ?? false)),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingSm),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'meal',
                    fillColor: theme.colorScheme.surface,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    counterText: '',
                  ),
                  maxLength: 24,
                  style: theme.textTheme.bodySmall,
                  onChanged: (value) {},
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
              child: Chip(
                label: Text(item.time.toString()),
                avatar: Icon(timeIcon, size: iconSizeMd),
                color: WidgetStatePropertyAll<Color>(theme.colorScheme.surface),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: paddingSm)),
            // IconDeleteButton(onClick: onDeleteClick),
          ],
        ),
      ),
    );
  }
}
