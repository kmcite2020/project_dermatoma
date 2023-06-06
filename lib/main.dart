// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:project_dermatoma/search/search.dart';
import 'package:project_dermatoma/settings/settings_page.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'patients/home_page.dart';
import 'shared/extensions.dart';
import 'themes/themes.dart';

void main() async {
  await initApp();
  runApp(const MyApp());
}

class MyApp extends ReactiveStatelessWidget {
  const MyApp({super.key});
  @override
  void didMountWidget(BuildContext context) async {
    await Future.delayed(1.seconds, FlutterNativeSplash.remove);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // navigatorKey: RM.navigate.navigatorKey,
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      // routerConfig: router.routerConfig,
      routerDelegate: router.routerDelegate,
      theme: themes,
    );
  }
}

final _appStateRM = RM.inject<Map<String, dynamic>>(
  () => {},
  persist: () => PersistState(
    key: '_appStateRM',
    fromJson: (json) => jsonDecode(json),
    toJson: (s) => jsonEncode(s),
  ),
);

/// appStateManager
Map<String, dynamic> get _ => _appStateRM.state;

/// getters
int get selectedIndex => _['index'] ?? 0;

/// setters
void updateSelectedIndex(int x) => _appStateRM.setState((_) => _['index'] = x);

final router = RM.injectNavigator(
  routes: {
    '/': (_) => const MainApp(),
  },
);

class MainApp extends ReactiveStatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const HomePage(),
        const SearchPage(),
        const SettingsPage(),
      ][selectedIndex]
          .pad(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onDestinationSelected: updateSelectedIndex,
      ),
    );
  }
}
