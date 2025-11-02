import 'package:dms_driver_app/presentation/dashboard/dashboard_screen.dart';
import 'package:dms_driver_app/presentation/login/login_screen.dart';
import 'package:dms_driver_app/presentation/splash/splash_screen.dart';
import 'package:dms_driver_app/presentation/test_screen.dart';
import 'package:go_router/go_router.dart' show GoRouter, GoRoute;

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    // GoRoute(path: '/splash', builder: (context, state) => const HomeScreen()),
    // GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    // GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/', builder: (context, state) => const MainLayout()),
  ],
);
