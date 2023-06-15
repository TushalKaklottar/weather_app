import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About",
          style: GoogleFonts.aBeeZee(
              fontSize: 19
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leadingWidth: 70,
        leading:  IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('setting_page');
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
              title: Text("Privacy Policy",
                style: GoogleFonts.akshar(
                    fontSize: 20
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(height: 20,color: Colors.black38),
            const SizedBox(height: 8),
            ListTile(
              title: Text("Open Source Licences",
                style: GoogleFonts.akshar(
                    fontSize: 20
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(height: 20,color: Colors.black38),
          ],
        ),
      ),
    );
  }
}
