import 'package:chattie/common/utils/custom_color.dart';
import 'package:chattie/common/utils/styles/custom_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Color? borderColor;
  final Color? color;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final double? borderRadius;
  final double? buttonHeight;
  final double? buttonWidth;
  final bool isLoading;

  const RoundedButton(
      {Key? key,
      required this.text,
      this.prefixIcon,
      this.suffixIcon,
      this.color,
      this.borderColor,
      this.textStyle,
      this.padding,
      this.borderRadius,
      this.buttonHeight,
      this.buttonWidth,
      this.onTap,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? CustomColors.black23,
      borderRadius: BorderRadius.circular(borderRadius ?? 5),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius ?? 5),
        child: Container(
          width: buttonWidth ?? double.infinity,
          height: buttonHeight ?? 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            border: Border.all(color: borderColor ?? Colors.transparent),
          ),
          padding: padding ?? EdgeInsets.zero,
          child: isLoading
              ? const CupertinoActivityIndicator(color: Colors.white)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    prefixIcon ?? Container(height: 0),
                    const SizedBox(width: 10),
                    Text(
                      text,
                      style: textStyle ??
                          CustomTextStyles.instance.lgText(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(width: 10),
                    suffixIcon ?? Container(height: 0),
                  ],
                ),
        ),
      ),
    );
  }
}
