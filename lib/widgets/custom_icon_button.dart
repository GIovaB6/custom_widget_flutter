import 'package:basic_utils_flutter/app_export.dart';

import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {super.key, this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.width,
      this.height,
      this.child,
      this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? width;

  double? height;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        iconSize: getSize(height ?? 0),
        padding: const EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: getSize(width ?? 0),
          height: getSize(height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      borderRadius: _setBorderRadius(),
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll18:
        return getPadding(
          all: 18,
        );
      case IconButtonPadding.PaddingAll7:
        return getPadding(
          all: 7,
        );
      default:
        return getPadding(
          all: 4,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.FillTeal50001:
        return ColorConstant.teal50001;
      case IconButtonVariant.FillBlack90001:
        return ColorConstant.black90001;
      case IconButtonVariant.FillLightblue300:
        return ColorConstant.lightBlue300;
      case IconButtonVariant.FillGreen700:
        return ColorConstant.green700;
      case IconButtonVariant.FillRedA200:
        return ColorConstant.redA200;
      case IconButtonVariant.FillDeeppurple400:
        return ColorConstant.deepPurple400;
      case IconButtonVariant.FillBluegray40001:
        return ColorConstant.blueGray40001;
      case IconButtonVariant.FillAmber300:
        return ColorConstant.amber300;
      default:
        return ColorConstant.gray300;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.RoundedBorder13:
        return BorderRadius.circular(
          getHorizontalSize(
            13.00,
          ),
        );
      case IconButtonShape.RoundedBorder25:
        return BorderRadius.circular(
          getHorizontalSize(
            25.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            7.00,
          ),
        );
    }
  }
}

enum IconButtonShape {
  RoundedBorder13,
  RoundedBorder25,
  RoundedBorder7,
}

enum IconButtonPadding {
  PaddingAll18,
  PaddingAll7,
  PaddingAll4,
}

enum IconButtonVariant {
  FillGray300,
  FillTeal50001,
  FillBlack90001,
  FillLightblue300,
  FillGreen700,
  FillRedA200,
  FillDeeppurple400,
  FillBluegray40001,
  FillAmber300,
}
