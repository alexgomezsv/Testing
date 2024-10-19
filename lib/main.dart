import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:testing/ui/splash/splash_screen.dart';
import 'package:testing/utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const testing());
}

class testing extends StatelessWidget {
  const testing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget!),
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
            background: Container(color: const Color(0xFFF5F5F5))),
        initialRoute: Routes.splash,
        onGenerateRoute: (RouteSettings settings) {
          return Routes.fadeThrough(settings, (context) {
            switch (settings.name) {
              case Routes.splash:
                return const SplashScreen();
              default:
                return const SizedBox.shrink();
            }
          });
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark());
  }
}
