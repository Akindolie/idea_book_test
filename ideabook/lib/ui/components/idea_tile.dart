import 'package:flutter/material.dart';

import '../common/text_styles.dart';
import '../common/ui_helpers.dart';

class IdeaTile extends StatelessWidget {
  const IdeaTile({
    super.key,
    required this.title,
    required this.content,
    required this.time,
    required this.date,
  });

  final String title;
  final String content;
  final String time;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 149,
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2C),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 2),
              child: SizedBox(
                height: 20,
                child: Text(
                  title,
                  style: kTitleTS.copyWith(fontSize: 14),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF202020),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Text(
                        content,
                        style: kBodyTS.copyWith(color: const Color(0xFFDBDADA)),
                        textAlign: TextAlign.justify,
                        //overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        softWrap: true,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          date,
                          style: kDateTS,
                        ),
                        horizontalSpaceTiny,
                        Container(
                          width: 3,
                          height: 3,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFB2B1B1),
                            shape: OvalBorder(),
                          ),
                        ),
                        horizontalSpaceTiny,
                        Text(
                          time,
                          style: kDateTS,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
