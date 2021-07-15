import 'package:earthquake_app/features/presenter/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    // Simple route using the ChildRoute
    // ChildRoute('/login', child: (_, __) => LoginPage()),
    ChildRoute('/', child: (_, args) => HomePage()),
    // ChildRoute('/sign-up', child: (_, __) => SignUpPage()),
  ];
}
