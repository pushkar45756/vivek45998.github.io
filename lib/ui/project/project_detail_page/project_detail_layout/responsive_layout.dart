import 'package:flutter/cupertino.dart';


class ProjectResponsiveLayout extends StatelessWidget {
  const ProjectResponsiveLayout({
    Key? key,
    required this.mobileBody,
    required this.desktopBody,
  }) : super(key: key);
  final Widget mobileBody;
  final Widget desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 602) {
        return mobileBody;
      } else {
        return desktopBody;
      }
    });
  }
}
