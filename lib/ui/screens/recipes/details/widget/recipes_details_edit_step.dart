part of '../recipes_details_screen.dart';

class _RecipesDetailsEditStep extends StatefulWidget {
  const _RecipesDetailsEditStep({
    required this.index,
    required this.isLast,
    required this.initialValue,
    required this.onValueChange,
  });

  final int index;

  final bool isLast;

  final String initialValue;

  final Function(String) onValueChange;

  @override
  State<_RecipesDetailsEditStep> createState() => _RecipesDetailsEditStepState();
}

class _RecipesDetailsEditStepState extends State<_RecipesDetailsEditStep> {
  final valueController = TextEditingController();

  @override
  void dispose() {
    valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    valueController.text = widget.initialValue.toString();

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: paddingXs),
          child: Text(
            '${widget.index + 1}.',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: TextField(
            controller: valueController,
            keyboardType: TextInputType.text,
            minLines: 2,
            maxLines: 100,
            maxLength: 300,
            style: theme.textTheme.bodyMedium,
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(),
              fillColor: theme.colorScheme.primaryContainer,
              filled: true,
              suffixIcon:
                  (widget.isLast)
                      ? Padding(
                        padding: EdgeInsets.all(paddingXxs),
                        child: IconButton(
                          onPressed: () => context.read<RecipesDetailsBloc>().add(RecipesDetailsStepDeleted()),
                          icon: Icon(Icons.delete),
                        ),
                      )
                      : null,
            ),
            onChanged: (value) => widget.onValueChange.call(value),
          ),
        ),
      ],
    );

    // return ;

    // return ;

    // return Row(
    //   children: [
    //     Icon(kcalIcon, color: Colors.red, size: iconSizeXl),
    //     Padding(padding: EdgeInsets.only(left: paddingMd)),
    //     Text(l10n.energy, textAlign: TextAlign.start, style: theme.textTheme.labelLarge),
    //     Spacer(),
    //     SizedBox(
    //       width: 112.0,
    //       child: TextFormField(
    //         controller: valueController,
    //         keyboardType: TextInputType.number,
    //         inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    //         decoration: InputDecoration(
    //           isDense: true,
    //           border: OutlineInputBorder(),
    //           fillColor: theme.colorScheme.primaryContainer,
    //           filled: true,
    //           suffixText: l10n.kcal,
    //         ),
    //         onChanged: (value) => widget.onValueChange.call(value.isEmpty ? 0 : int.parse(value)),
    //       ),
    //     ),
    //   ],
    // );
  }
}
