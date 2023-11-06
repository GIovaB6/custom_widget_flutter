
import 'package:basic_utils_flutter/app_export.dart';
import 'package:basic_utils_flutter/theme/app_style.dart';
import 'package:custom_widget_flutter/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key})
      : super(
    key: key,
  );

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  @override
  void initState() {
    super.initState();
  }

  int selectedIndex = 1;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgSearchicon,
      title: "Route_1".tr,
      type: BottomBarEnum.Route1,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSearchicon,
      title: "Route_2".tr,
      type: BottomBarEnum.Route2,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSearchicon,
      title: "Route_3".tr,
      type: BottomBarEnum.Route3,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSearchicon,
      title: "Route_4".tr,
      type: BottomBarEnum.Route4,
    )
  ];

  void onChange(int index, BottomBarEnum type) {
    selectedIndex = index;
    Navigator.pushNamed(Constants.navigatorKey.currentContext!, getCurrentRoute(type));
    setState(() {});
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Route1:
        return AppRoutes.myScreen;      
      case BottomBarEnum.Route2:
        return AppRoutes.myScreen;
      case BottomBarEnum.Route3:
        return AppRoutes.myScreen;
      case BottomBarEnum.Route4:
        return AppRoutes.myScreen;
      default:
        return "/";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.gray50Ef,
        border: Border(
          top: BorderSide(
            color: ColorConstant.gray8005b,
            width: getHorizontalSize(
              1,
            ),
          ),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  svgPath: bottomMenuList[index].icon,
                  height: getSize(
                    24,
                  ),
                  width: getSize(
                    24,
                  ),
                  color: ColorConstant.gray500,
                ),
                Padding(
                  padding: getPadding(
                    top: 3,
                  ),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSFProTextMedium10.copyWith(
                      color: ColorConstant.gray500,
                    ),
                  ),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  svgPath: bottomMenuList[index].icon,
                  height: getVerticalSize(
                    20,
                  ),
                  width: getHorizontalSize(
                    29,
                  ),
                  color: ColorConstant.teal500,
                ),
                Padding(
                  padding: getPadding(
                    top: 6,
                  ),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSFProTextBold10.copyWith(
                      color: ColorConstant.teal500,
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          onChange(index, bottomMenuList[index].type);
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Route1,
  Route2,
  Route3,
  Route4,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    this.title,
    required this.type,
  });

  String icon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
