import 'package:flutter/material.dart';
import 'package:patient_appointment/features/on_boarding/domain/entities/page_view_item_entity.dart';
import 'package:patient_appointment/features/on_boarding/presentation/view/widgets/page_view_item.dart';

class PageViewBody extends StatelessWidget {
  const PageViewBody({super.key, required PageController pageController})
    : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: pgaeViewItemList.length,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      itemBuilder: (context, index) {
        final pageViewItem = pgaeViewItemList[index];
        return PageViewItem(pageViewItemEntity: pageViewItem);
      },
    );
  }
}
