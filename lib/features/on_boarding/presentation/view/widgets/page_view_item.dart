import 'package:flutter/material.dart';
import 'package:patient_appointment/core/utils/extentions.dart';
import 'package:patient_appointment/features/on_boarding/domain/entities/page_view_item_entity.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.pageViewItemEntity});
  final PageViewItemEntity pageViewItemEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(pageViewItemEntity.image, fit: BoxFit.fill),
        SizedBox(height: context.responsiveHeight(64)),
        Center(
          child: Column(
            children: [
              Text(
                pageViewItemEntity.title,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              SizedBox(height: context.responsiveHeight(5)),
              SizedBox(
                width: context.responsiveWidth(335),
                child: Text(
                  textAlign: TextAlign.center,
                  pageViewItemEntity.description,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ),

              // SizedBox(height: context.responsiveHeight(120)),
            ],
          ),
        ),

        // Container(
        //   width: context.responsiveWidth(375),
        //   height: context.responsiveHeight(394),
        //   clipBehavior: Clip.antiAlias,
        //   decoration: ShapeDecoration(
        //     color: AppColors.primaryColor,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.circular(50),
        //         bottomRight: Radius.circular(50),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
