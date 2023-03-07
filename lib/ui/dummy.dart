
///dumy auth
// var navigator =
// SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
//     LocalStorageWindow.getValue(LocalStorage.loginBearerToken) != null
//     ? VxNavigator(
//   routes: {
//     RouterUrlName.samplePage: (_, param) =>
//         MaterialPage(child: SamplePage()),
//     RouterUrlName.layoutPage: (_, param) => MaterialPage(
//       child: LayoutPage(
//         user: param,
//       ),
//     ),
//     RouterUrlName.projectLayoutPage: (_, param) => MaterialPage(
//       child: ProjectLayoutBuilder(
//         projectList: param,
//       ),
//     ),
//     RouterUrlName.userDetail: (_, param) => MaterialPage(
//       child: UserDetail(),
//     ),
//     RouterUrlName.projectPage: (_, param) =>
//         MaterialPage(child: ProjectPage())
//   },
//
// )
//     : VxNavigator(routes: {
//   "/": (_, __) => const MaterialPage(
//     child: LoginPage(),
//   )
// });

///dhsfhdgsfhg
// VxNavigator(
// notFoundPage: (uri, params) => MaterialPage(
// key: ValueKey('Not-found-page'),
// child: Builder(
// builder: (context) => Scaffold(
// body: Center(
// child: Text('Page ${uri.path} not found'),
// ),
// ),
// ),
// ),
// observers: [MyObs()],
// routes: {
// "/": (_, __) =>
// SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
// LocalStorageWindow.getValue(
// LocalStorage.loginBearerToken) !=
// null
// ? const MaterialPage(
// child: SamplePage(),
// )
//     : const MaterialPage(
// child: LoginPage(),
// ),
// RouterUrlName.layoutPage: (_, param) =>
// SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
// LocalStorageWindow.getValue(
// LocalStorage.loginBearerToken) !=
// null
// ? MaterialPage(
// child: LayoutPage(
// user: param,
// ),
// )
//     : const MaterialPage(
// child: LoginPage(),
// ),
// RouterUrlName.samplePage: (_, __) =>
// SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
// LocalStorageWindow.getValue(
// LocalStorage.loginBearerToken) !=
// null
// ? const MaterialPage(
// child: SamplePage(),
// )
//     : const MaterialPage(
// child: LoginPage(),
// ),
// RouterUrlName.projectPage: (_, __) =>
// SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
// LocalStorageWindow.getValue(
// LocalStorage.loginBearerToken) !=
// null
// ? const MaterialPage(child: ProjectPage())
//     : const MaterialPage(
// child: LoginPage(),
// ),
// RouterUrlName.userDetail: (_, __) =>
// SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
// LocalStorageWindow.getValue(
// LocalStorage.loginBearerToken) !=
// null
// ? MaterialPage(
// child: UserDetail(),
// )
//     : const MaterialPage(
// child: LoginPage(),
// ),
// RouterUrlName.projectLayoutPage: (_, params) =>
// SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
// LocalStorageWindow.getValue(
// LocalStorage.loginBearerToken) !=
// null
// ? MaterialPage(
// child: ProjectLayoutBuilder(
// projectList: params,
// ),
// )
//     : const MaterialPage(
// child: LoginPage(),
// ),
// },
// ),


///hbdhbsfhkbdksjf
// {{required String searchValue, required String searchKey}
// RouterUrlName.layoutPage: (_, param) =>
// SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
// LocalStorageWindow.getValue(LocalStorage.loginBearerToken) != null?
// MaterialPage(
// child: LayoutPage(
// user: param,
// ),
// ): const MaterialPage(child: LoginPage(),),
//
// RouterUrlName.samplePage: (_, __) =>SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
// LocalStorageWindow.getValue(LocalStorage.loginBearerToken) != null?
// const MaterialPage(
// child: SamplePage(),
// ):const MaterialPage(child: LoginPage(),),
//
// RouterUrlName.projectPage: (_, __) =>SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
// LocalStorageWindow.getValue(LocalStorage.loginBearerToken) != null?
// const MaterialPage(child: ProjectPage()):const MaterialPage(child: LoginPage(),),
//
// RouterUrlName.userDetail: (_, __) =>SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
// LocalStorageWindow.getValue(LocalStorage.loginBearerToken) != null?
// MaterialPage(
// child: UserDetail(),
// ):const MaterialPage(child: LoginPage(),),
//
// RouterUrlName.projectLayoutPage: (_, params) =>SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
// LocalStorageWindow.getValue(LocalStorage.loginBearerToken) != null?
// MaterialPage(
// child: ProjectLayoutBuilder(
// projectList: params,
// ),
// ):const MaterialPage(child: LoginPage(),),
// }