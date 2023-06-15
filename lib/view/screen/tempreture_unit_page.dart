import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tem_Unit_page extends StatefulWidget {
  const Tem_Unit_page({Key? key}) : super(key: key);

  @override
  State<Tem_Unit_page> createState() => _Tem_Unit_pageState();
}

class _Tem_Unit_pageState extends State<Tem_Unit_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temperature Unit",
          style: GoogleFonts.aBeeZee(
            fontSize: 19
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leadingWidth: 60,
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
          children:  [
            ListTile(
              title: Text("Degree Celsius",
                style: GoogleFonts.akshar(
                    fontSize: 22
                ),
              ),
              subtitle: Text("Degree Celsius/◦c",
              style: GoogleFonts.akshar(
                fontSize: 16
              ),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(height: 20,color: Colors.black38),
            const SizedBox(height: 8),
            ListTile(
              title: Text("Degree Fahrenheit",
                style: GoogleFonts.akshar(
                    fontSize: 22
                ),
              ),
              subtitle: Text("Degree Fahrenheit/◦f",
                style: GoogleFonts.akshar(
                    fontSize: 16
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
