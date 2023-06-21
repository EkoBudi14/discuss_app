import 'package:discuss_apps/common/session.dart';
import 'package:discuss_apps/data/sources/models/user.dart';
import 'package:discuss_apps/presentation/components/components_error_page.dart';
import 'package:discuss_apps/presentation/pages/home_page.dart';
import 'package:discuss_apps/presentation/pages/login_page.dart';
import 'package:discuss_apps/presentation/pages/register_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const home = '/';
  static const login = '/login';
  static const register = '/register';

  static GoRouter routerConfig = GoRouter(
    errorBuilder: (context, state) => const ComponentErrorPage(),
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      User? user = await Session.getUser();
      if (user == null) {
        if (state.location == login || state.location == register) {
          return null;
        }
        return login;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
    ],
  );
}
