import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather",
        style: GoogleFonts.aBeeZee(),
      ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leadingWidth: 70,
        leading:  IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('home_page');
          },
          icon:  const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('tem_unit_page');
              },
              splashColor: Colors.grey,
              title: const Text("Temperature Unit"),
              subtitle: const Text("Degree Celsius/◦c"),
              trailing: const Icon(Icons.navigate_next),
            ),

            const SizedBox(height: 8),
            const Divider(height: 20,color: Colors.black38),
            const SizedBox(height: 8),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('about_page');
              },
              splashColor: Colors.black38,
              title: const Text("About"),
              trailing: const Icon(Icons.navigate_next),
            ),
            const SizedBox(height: 8),
            const Divider(height: 20,color: Colors.black38),
          ],
        ),
      ),
    );
  }
}
