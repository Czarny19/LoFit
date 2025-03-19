part of '../recipes_details_screen.dart';

class _RecipesDetailsSectionHeader extends SliverPersistentHeaderDelegate {
  const _RecipesDetailsSectionHeader({required this.label});

  final String label;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(color: theme.colorScheme.surface),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: paddingMd / 2, decoration: BoxDecoration(color: theme.colorScheme.surface)),
          SizedBox(width: MediaQuery.of(context).size.width, child: Header(text: label)),
          Container(height: paddingMd / 2, decoration: BoxDecoration(color: theme.colorScheme.surface)),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 40 + paddingMd;

  @override
  double get minExtent => 40 + paddingMd;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
