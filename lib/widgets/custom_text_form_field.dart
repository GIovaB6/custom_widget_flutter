import 'package:basic_utils_flutter/app_export.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
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
      this.validator});

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

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
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
      case TextFormFieldFontStyle.sFProDisplayRegular17:
        return TextStyle(
          color: ColorConstant.black90066,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.blueGray500,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'SF Pro Display',
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
      case TextFormFieldVariant.outlineGray500:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray500,
            width: 1,
          ),
        );
      case TextFormFieldVariant.none:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case TextFormFieldVariant.outlineGray500:
        return ColorConstant.whiteA700;
      default:
        return ColorConstant.gray30059;
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
