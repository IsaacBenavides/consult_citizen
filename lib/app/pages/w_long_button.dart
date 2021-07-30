import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LongElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? widgetTitle;
  final String? titleButton;
  final bool useWidgetTitle;
  final Color? buttonColor;

  const LongElevatedButton(
      {Key? key,
      @required this.onPressed,
      @required this.titleButton,
      this.buttonColor,
      this.useWidgetTitle = false,
      this.widgetTitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.sp,
        width: double.infinity,
        child: ElevatedButton(
            onPressed: onPressed,
            child: useWidgetTitle
                ? widgetTitle
                : Text(
                    titleButton ?? "",
                  ),
            style: ButtonStyle(
              shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                  (states) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      )),
            )));
  }
}
