import 'package:basic_utils_flutter/app_export.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.shape,
    this.padding,
    this.variant,
    this.fontStyle,
    this.alignment,
    this.width,
    this.margin,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.isObscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.validator,
    this.titleEnabled,
    this.title,
    this.readOnly = false,
  });

  final TextFormFieldShape? shape;

  final TextFormFieldPadding? padding;

  final TextFormFieldVariant? variant;

  final TextFormFieldFontStyle? fontStyle;

  final Alignment? alignment;

  final double? width;

  final EdgeInsetsGeometry? margin;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final bool? isObscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final FormFieldValidator<String>? validator;

  final bool? titleEnabled;

  final String? title;

  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(context),
          )
        : _buildTextFormFieldWidget(context);
  }

  /// [isValid] Check if value of the field is valid using validator or text.isNotEmpty
  bool isValid() {
    if (validator != null) {
      if (validator?.call(controller?.text) == null) {
        return true;
      } else {
        return false;
      }
    } else {
      return controller?.text.isNotEmpty ?? false;
    }
  }

  _buildTextFormFieldWidget(BuildContext context) {
    return (titleEnabled != null && titleEnabled!)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: width ?? double.maxFinite,
                margin: margin,
                child: TextFormField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  readOnly: readOnly,
                  controller: controller,
                  focusNode: focusNode,
                  autofocus: autofocus!,
                  style: _setFontStyle(),
                  obscureText: isObscureText!,
                  textInputAction: textInputAction,
                  keyboardType: textInputType,
                  maxLines: maxLines ?? 1,
                  decoration: _buildDecoration(),
                  validator: validator,
                ),
              ),
            ],
          )
        : Container(
            width: width ?? double.maxFinite,
            margin: margin,
            child: TextFormField(
              readOnly: readOnly,
              controller: controller,
              focusNode: focusNode,
              autofocus: autofocus!,
              style: _setFontStyle(),
              obscureText: isObscureText!,
              textInputAction: textInputAction,
              keyboardType: textInputType,
              maxLines: maxLines ?? 1,
              decoration: _buildDecoration(),
              validator: validator,
            ),
          );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
          color: const Color(0xFF0E150B),
          fontSize: getFontSize(
            16,
          ),
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            4.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: const BorderSide(
            color: Color(0xFF0E150B),
            width: 1,
          ),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      default:
        return Colors.white;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.outlineGray500:
        return true;
      case TextFormFieldVariant.none:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.paddingAll13:
        return getPadding(
          all: 13,
        );
      case TextFormFieldPadding.paddingAll7:
        return getPadding(
          all: 7,
        );
      default:
        return getPadding(
          left: 13,
          top: 13,
          bottom: 13,
        );
    }
  }
}

enum TextFormFieldShape {
  roundedBorder4,
}

enum TextFormFieldPadding {
  paddingT13,
  paddingAll13,
  paddingAll7,
}

enum TextFormFieldVariant {
  none,
  fillGray30059,
  outlineGray500,
}

enum TextFormFieldFontStyle {
  sFProDisplayRegular16,
  sFProDisplayRegular17,
}
