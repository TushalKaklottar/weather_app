import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../weather_provider/weather_provider.dart';

class AddCityPage extends StatefulWidget {
  const AddCityPage({Key? key}) : super(key: key);

  @override
  State<AddCityPage> createState() => _AddCityPageState();
}

class _AddCityPageState extends State<AddCityPage> {

  late String currentName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:  Text("Add city",
        style: GoogleFonts.aBeeZee(),
        ),
        leadingWidth: 70,
        leading:  IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon:  Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 22,
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted:  (String name) {
                if (name.isNotEmpty) {
                  Provider.of<WeatherProvider>(context, listen: false)
                      .locationchange(name);
                } else {
                  Provider.of<WeatherProvider>(context , listen: false)
                      .locationchange(
                    Provider.of<WeatherProvider>(context).location
                  );
                }
              },
              controller: Provider.of<WeatherProvider>(context).citynamecontroller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey,
          enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(19, 19))),
          focusedBorder: const OutlineInputBorder(
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade800,
            size: 29,
          ),
          hintText: "Enter City...",
          hintStyle: GoogleFonts.akshar(
            color: Colors.grey.shade800,
            letterSpacing: 1,
            fontSize: 16
          ),
        ),
            ),
            const SizedBox(height: 40,),
            Text(
              "TOP CITIES",
              style: GoogleFonts.akshar(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("Surat",
                    style: GoogleFonts.akshar(fontSize: 16,color: Colors.white),),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("New Delhi",
                    style: GoogleFonts.akshar(
                        fontSize: 16,
                        color: Colors.white),),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("Kolkata",
                    style: GoogleFonts.akshar(fontSize: 16,color: Colors.white),),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child:  Text("Mumbai",
                    style: GoogleFonts.akshar(
                        fontSize: 16,color: Colors.white),),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("Chennai",
                    style: GoogleFonts.akshar(
                        fontSize: 16,color: Colors.white),),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("Lucknow",
                    style: GoogleFonts.akshar(fontSize: 16,color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            const Divider(color: Colors.white70,),
            const SizedBox(height: 20,),
             Text(
              "TOP CITIES - WORLD",
              style: GoogleFonts.akshar(
                fontSize: 20,
                letterSpacing: 1,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("New York",
                    style: GoogleFonts.akshar(fontSize: 16,color: Colors.white),),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("Paris",
                    style: GoogleFonts.akshar(fontSize: 16,color: Colors.white),
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("London",
                    style: GoogleFonts.akshar(fontSize: 16,color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("Tokyo",
                    style: GoogleFonts.akshar(fontSize: 16,color: Colors.white),
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("Rome",
                    style: GoogleFonts.akshar(fontSize: 16,color: Colors.white),
                    ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("Dubai",
                    style: GoogleFonts.akshar(fontSize: 16,color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade900,
    );
  }
}
