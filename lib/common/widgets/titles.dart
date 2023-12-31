import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskoopia/common/utils/constants.dart';
import 'package:taskoopia/common/widgets/appstyle.dart';
import 'package:taskoopia/common/widgets/height_spacer.dart';
import 'package:taskoopia/common/widgets/reusable_text.dart';
import 'package:taskoopia/common/widgets/width_spacer.dart';
import 'package:taskoopia/features/todo/controllers/todo/todo_provider.dart';

class BottomTitles extends StatelessWidget {
  const BottomTitles({Key? key, required this.text1, required this.text2, this.clr}) : super(key: key);

  final String text1;
  final String text2;
  final Color? clr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConst.kWidth,
      child: Padding(padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ref, child){
                var color = ref.read(todoStateProvider.notifier).getRandomColor();
                return Container(
                  height: 80,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),

                    color: color,
                  ),
                );
              }
            ),
            WidthSpacer(wydth: 15),
            Padding(padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(text: text1,
                      style: appstyle(24, AppConst.kLight, FontWeight.bold)),

                  const HeightSpacer(value: 10),

                  ReusableText(text: text2,
                      style: appstyle(12, AppConst.kLight, FontWeight.normal)),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
