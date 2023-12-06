import 'package:basic_utils_flutter/app_export.dart';

import 'package:flutter/material.dart';

class CustomFloatingEditText extends StatelessWidget {
  CustomFloatingEditText(
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
      this.labelText,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator});

  FloatingEditTextShape? shape;

  FloatingEditTextPadding? padding;

  FloatingEditTextVariant? variant;

  FloatingEditTextFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? autofocus;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? labelText;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildFloatingEditTextWidget(),
          )
        : _buildFloatingEditTextWidget();
  }

  _buildFloatingEditTextWidget() {
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
      labelText: labelText ?? "",
      labelStyle: _setFontStyle(),
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
      case FloatingEditTextFontStyle.SFProDisplayBold14:
        return TextStyle(
          color: ColorConstant.blueGray400,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w700,
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
      case FloatingEditTextVariant.None:
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
      default:
        return ColorConstant.gray30059;
    }
  }

  _setFilled() {
    switch (variant) {
      case FloatingEditTextVariant.None:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case FloatingEditTextPadding.PaddingTB16:
        return getPadding(
          left: 9,
          top: 9,
          right: 9,
          bottom: 16,
        );
      default:
        return getPadding(
          left: 12,
          top: 12,
          right: 12,
          bottom: 13,
        );
    }
  }
}

enum FloatingEditTextShape {
  RoundedBorder4,
}

enum FloatingEditTextPadding {
  PaddingTB13,
  PaddingTB16,
}

enum FloatingEditTextVariant {
  None,
  FillGray30059,
}

enum FloatingEditTextFontStyle {
  SFProDisplayRegular16,
  SFProDisplayBold14,
}
