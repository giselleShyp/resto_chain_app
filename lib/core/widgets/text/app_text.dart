import 'package:flutter/material.dart';

enum ContentStyle {
  bodyLarge,
  bodyMedium,
  bodySmall,
  displayLarge,
  displayMedium,
  displaySmall,
  labelLarge,
  labelMedium,
  labelSmall,
  headlineSmall,
  headlineMedium,
  headlineLarge,
  titleLarge,
  titleMedium,
  titleSmall,
}

class AppText extends StatelessWidget {
  const AppText(
    this.content, {
    super.key,
    this.contentStyle,
    this.fontSize,
    this.fontWeight,
    this.contentColor,
    this.overflow,
    this.textAlign,
    this.softWrap,
    this.letterSpacing,
    this.lineHeight,
    this.maxLines,
  });

  final String content;
  final ContentStyle? contentStyle;
  final Color? contentColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool? softWrap;
  final double? letterSpacing;
  final double? lineHeight;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;

    //Text Style
    switch (contentStyle) {
      case ContentStyle.bodyLarge:
        textStyle = Theme.of(context).textTheme.bodyLarge!;
        break;
      case ContentStyle.bodyMedium:
        textStyle = Theme.of(context).textTheme.bodyMedium!;
        break;
      case ContentStyle.bodySmall:
        textStyle = Theme.of(context).textTheme.bodySmall!;
        break;
      case ContentStyle.displayLarge:
        textStyle = Theme.of(context).textTheme.displayLarge!;
        break;
      case ContentStyle.displayMedium:
        textStyle = Theme.of(context).textTheme.displayMedium!;
        break;
      case ContentStyle.displaySmall:
        textStyle = Theme.of(context).textTheme.displaySmall!;
        break;
      case ContentStyle.labelLarge:
        textStyle = Theme.of(context).textTheme.labelLarge!;
        break;
      case ContentStyle.labelMedium:
        textStyle = Theme.of(context).textTheme.labelMedium!;
        break;
      case ContentStyle.labelSmall:
        textStyle = Theme.of(context).textTheme.labelSmall!;
        break;
      case ContentStyle.headlineSmall:
        textStyle = Theme.of(context).textTheme.headlineSmall!;
        break;
      case ContentStyle.headlineMedium:
        textStyle = Theme.of(context).textTheme.headlineMedium!;
        break;
      case ContentStyle.titleLarge:
        textStyle = Theme.of(context).textTheme.titleLarge!;
        break;
      case ContentStyle.titleMedium:
        textStyle = Theme.of(context).textTheme.titleMedium!;
        break;
      case ContentStyle.titleSmall:
        textStyle = Theme.of(context).textTheme.titleSmall!;
        break;
      case ContentStyle.headlineLarge:
        textStyle = Theme.of(context).textTheme.headlineLarge!;
        break;

      default:
        textStyle = Theme.of(context).textTheme.bodyLarge!;
    }

    return Text(
      content,
      style: textStyle.copyWith(
        color: contentColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing ?? 0,
        height: lineHeight,
      ),
      softWrap: softWrap,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
