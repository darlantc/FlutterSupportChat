import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.bottom,
      handleTouth: true,
      dismissOtherOnShow: true,
      child: MaterialApp(
        title: 'Flutter chat',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: Modular.generateRoute,
        navigatorKey: Get.key,
        navigatorObservers: [
          // AppRouteObserver()
        ],
      ),
    );
  }
}

// class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
//   final SettingsStore settingsStore = Modular.get<SettingsStore>();

//   @override
//   void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
//     super.didPush(route, previousRoute);
//     if (route is PageRoute) {
//       print("didpush route $route");
//       settingsStore.setCurrentPage(APP_ROUTE.DASHBOARD);
//     }
//   }

//   @override
//   void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
//     super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
//     if (newRoute is PageRoute) {
//       print("replace route $newRoute");
//     }
//   }

//   @override
//   void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
//     super.didPop(route, previousRoute);
//     if (previousRoute is PageRoute && route is PageRoute) {
//       print("didpop route $route");
//     }
//   }
// }
