library responsive_content;

import 'package:flutter/material.dart';

class ResponsiveContent extends StatelessWidget {
  final Widget mobile;
  final Widget? mobileSmall;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveContent({
    Key? key,
    required this.mobile,
    this.mobileSmall,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  /// This size work fine on my design, maybe you need some customization depends on your design
  static bool isMobileSmall(BuildContext context) =>
      MediaQuery.of(context).size.width < 350;

  /// This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 800;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  // pixels
  static double mobileWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double tabletWidth(BuildContext context) => 500;
  static double desktopWidth(BuildContext context) => 500;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a desktop
    if (size.width >= 1100) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (size.width >= 800 && tablet != null) {
      return tablet!;
    }
    // If width it less then 350 then we called it mobile small
    else if (size.width <= 350 && mobileSmall != null) {
      return mobileSmall!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
