import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

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
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: LocalizationPage(),
    );
  }
}

class LocalizationPage extends StatefulWidget {
  LocalizationPage({
    super.key,
  });

  @override
  State<LocalizationPage> createState() => _LocalizationPageState();
}

class _LocalizationPageState extends State<LocalizationPage> {
  int? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app_bar_title",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30))
            .tr(),
        actions: [
          DropdownMenu(
            hintText: "language_text".tr(),
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 1, label: "urdu"),
              DropdownMenuEntry(value: 2, label: "english"),
            ],
            onSelected: (value) async {
              data = value;
              debugPrint("selected " + data.toString());

              if (data == 1) {
                await context.setLocale(Locale('ur', 'PK'));
                debugPrint("Urdu selected");
              } else if (data == 2) {
                await context.setLocale(Locale('en', 'US'));
                debugPrint("English selected");
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Text("content_text").tr(), // Example content text
      ),
    );
  }
}
