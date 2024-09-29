import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Controller/auth_controller.dart';
import 'Screens/landing_screen.dart';
import 'Themes/theme.dart';
import 'Utils/mobile_layout.dart';
import 'Utils/routes.dart';
import 'Widgets/error.dart';
import 'Widgets/loader.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ChatAppTheme.lightTheme,
      darkTheme: ChatAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(userDataAuthProvider).when(
        data: (user) {
          if (user == null) {
            return const LandingScreen();
          }
          return const MobileLayoutScreen();
        },
        error: (err, trace) {
          return ErrorScreen(
            error: err.toString(),
          );
        },
        loading: () => const Loader(),
      ),
    );
  }
}
