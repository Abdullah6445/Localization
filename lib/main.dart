import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // final webRouter = MyRouter();
  // final mobileRouter = getMobileRoutes();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('ur', 'PK'),
          Locale('en', 'US'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        saveLocale: false,
        startLocale: Locale('ur', 'PK'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const LocalizationPage());
  }
}

class LocalizationPage extends StatefulWidget {
  const LocalizationPage({
    super.key,
  });

  @override
  State<LocalizationPage> createState() => _LocalizationPageState();
}

class _LocalizationPageState extends State<LocalizationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text("my_name",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30))
              .tr(),
        ),
      ),
    );
  }
}
