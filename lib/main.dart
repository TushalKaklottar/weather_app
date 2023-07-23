import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view/screen/Home_page.dart';
import 'package:weather_app/view/screen/about_page.dart';
import 'package:weather_app/view/screen/add_city_page.dart';
import 'package:weather_app/view/screen/manage_city_page.dart';
import 'package:weather_app/view/screen/setting_page.dart';
import 'package:weather_app/view/screen/splash_screen.dart';
import 'package:weather_app/view/screen/tempreture_unit_page.dart';
import 'package:weather_app/weather_provider/connectivity_provider.dart';
import 'package:weather_app/weather_provider/weather_provider.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();

    runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (context) => ConnectivityProvider(),
            ),
            ChangeNotifierProvider(
                create: (context) => WeatherProvider(),
            )
          ],
        builder: (context,child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode:ThemeMode.system,
          routes: {
            '/': (context) => const Splash_screen(),
            'home_page': (context) => const Home_page(),
            'manage_city_page' : (context) => const ManageCity(),
            'setting_page': (context) => const SettingPage(),
            'add_city_page': (context) => const AddCityPage(),
            'tem_unit_page': (context) => const Tem_Unit_page(),
            'about_page' : (context) => const AboutPage(),
          },
        ),
      )
    );
}
