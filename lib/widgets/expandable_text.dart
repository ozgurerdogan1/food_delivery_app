// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final TextAlign textAlign;
  final double textSize;
  final Color color;
  final double height;
  const ExpandableTextWidget(
      {Key? key,
      required this.text,
      required this.textSize,
      this.color = AppColors.paraColor,
      required this.height,
      this.textAlign = TextAlign.justify})
      : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > Dimensions.expandableTextHeight) {
      firstHalf = widget.text.substring(0, Dimensions.expandableTextHeight.toInt());
      secondHalf =
          widget.text.substring(Dimensions.expandableTextHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("textAlign ${widget.textAlign}");
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              firstHalf,
              textAlign: widget.textAlign,
              size: widget.textSize,
              color: widget.color,
              height: widget.height,
            )
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SmallText(
                hiddenText ? "$firstHalf..." : firstHalf + secondHalf,
                textAlign: widget.textAlign,
                size: widget.textSize,
                color: widget.color,
                height: widget.height,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    hiddenText = !hiddenText;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(3.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SmallText("Show more",
                          color: AppColors.mainColor,
                          textAlign: widget.textAlign,
                          size: widget.textSize),
                      Icon(hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                          color: AppColors.mainColor)
                    ],
                  ),
                ),
              )
            ]),
    );
  }
}
