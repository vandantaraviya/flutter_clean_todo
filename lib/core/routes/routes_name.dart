part of 'routes.dart';

@immutable
class _AppRoute {
  final String path;
  final String name;
  const _AppRoute({required this.name, required this.path});
}

abstract class Routes {
  Routes._();
  static const initial = _AppRoute(name: _Names.initialName, path: _Paths.initialPath);
  static const home = _AppRoute(name: _Names.homeName, path: _Paths.homePath);
}

abstract class _Paths {
  _Paths._();
  static const initialPath = '/';
  static const homePath = '/home';
}

abstract class _Names {
  _Names._();
  static const initialName = 'Initial';
  static const homeName = 'Home';
}
