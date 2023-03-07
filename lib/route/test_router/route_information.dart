// import 'package:flutter/cupertino.dart';
//
// import '../../get_route_delegate.dart';
//
//
// class AppRouteInformationParser extends RouteInformationParser<AppRouterDelegate> {
//   @override
//   Future<AppRouterDelegate> parseRouteInformation(
//       RouteInformation? routeInformation) async {
//     final uri = Uri.parse(routeInformation?.location??'');
//     // Handle '/'
//     if (uri.pathSegments.length == 0) {
//       return AppRouterDelegate.;
//     }
//
//     // Handle '/book/:id'
//     if (uri.pathSegments.length == 2) {
//       if (uri.pathSegments[0] != 'book') return BookRoutePath.unknown();
//       var remaining = uri.pathSegments[1];
//       var id = int.tryParse(remaining);
//       if (id == null) return BookRoutePath.unknown();
//       return BookRoutePath.details(id);
//     }
//
//     // Handle unknown routes
//     return BookRoutePath.unknown();
//   }
//
//   @override
//   RouteInformation restoreRouteInformation(BookRoutePath path) {
//     if (path.isUnknown) {
//       return RouteInformation(location: '/404');
//     }
//     if (path.isHomePage) {
//       return RouteInformation(location: '/');
//     }
//     if (path.isDetailsPage) {
//       return RouteInformation(location: '/book/${path.id}');
//     }
//     return null;
//   }
// }