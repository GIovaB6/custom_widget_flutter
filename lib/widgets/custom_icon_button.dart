import 'package:basic_utils_flutter/app_export.dart';

import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.width,
      this.height,
      this.child,
      this.onTap});

  final IconButtonShape? shape;

  final IconButtonPadding? padding;

  final IconButtonVariant? variant;

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final double? width;

  final double? height;

  final Widget? child;

  final VoidCallback? onTap;

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
      case IconButtonPadding.paddingAll18:
        return getPadding(
          all: 18,
        );
      case IconButtonPadding.paddingAll7:
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
      case IconButtonVariant.fillTeal50001:
        return ColorConstant.teal50001;
      case IconButtonVariant.fillBlack90001:
        return ColorConstant.black90001;
      case IconButtonVariant.fillLightblue300:
        return ColorConstant.lightBlue300;
      case IconButtonVariant.fillGreen700:
        return ColorConstant.green700;
      case IconButtonVariant.fillRedA200:
        return ColorConstant.redA200;
      case IconButtonVariant.fillDeeppurple400:
        return ColorConstant.deepPurple400;
      case IconButtonVariant.fillBluegray40001:
        return ColorConstant.blueGray40001;
      case IconButtonVariant.fillAmber300:
        return ColorConstant.amber300;
      default:
        return ColorConstant.gray300;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.roundedBorder13:
        return BorderRadius.circular(
          getHorizontalSize(
            13.00,
          ),
        );
      case IconButtonShape.roundedBorder25:
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
  roundedBorder13,
  roundedBorder25,
  roundedBorder7,
}

enum IconButtonPadding {
  paddingAll18,
  paddingAll7,
  paddingAll4,
}

enum IconButtonVariant {
  fillGray300,
  fillTeal50001,
  fillBlack90001,
  fillLightblue300,
  fillGreen700,
  fillRedA200,
  fillDeeppurple400,
  fillBluegray40001,
  fillAmber300,
}
