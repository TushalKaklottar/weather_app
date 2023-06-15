import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../models/weather_model.dart';
import '../../weather_provider/connectivity_provider.dart';
import '../../weather_provider/weather_provider.dart';

class ManageCity extends StatefulWidget {
  const ManageCity({Key? key}) : super(key: key);

  @override
  State<ManageCity> createState() => _ManageCityState();
}

class _ManageCityState extends State<ManageCity> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:  Text("Manage cities",
          style: GoogleFonts.aBeeZee(),
        ),
        leadingWidth: 70,
        leading:  IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('home_page');
          },
          icon:  Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 22,
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("add_city_page");
        },
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),

      body: (Provider.of<ConnectivityProvider>(context)
          .connectivityModel
          .connectivitystatus ==
          "Waiting..")
          ? const Center(
        child: Text("No Data Connection"),
      )
      : FutureBuilder(
          future: Provider.of<WeatherProvider>(context, listen: false)
              .Weatherdata(locationame: "Surat"),
          builder: (context , snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("ERROR : ${snapshot.error}"),
              );
            }
            else if (snapshot.hasData) {
              WeatherModel? weatherdata = snapshot.data;
              return (weatherdata == null)
                  ? const Center(
                child: Text("No Data available"),
              ) : Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://images.pexels.com/photos/2793175/pexels-photo-2793175.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                    fit: BoxFit.cover,
                    opacity: 0.8,
                    colorFilter: ColorFilter.srgbToLinearGamma(),
                  ),
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title:  Center(
                                    child: Text(
                                      "Your History Delete ?",
                                      style: GoogleFonts.akshar(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil('manage_city_page', (route) => false
                                            );
                                          });
                                        },
                                  child: Container(
                                    height: 35,
                                    width: 90,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey.shade400,
                                    ),
                                    child: Text("Dismiss",
                                      style: GoogleFonts.akshar(
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                      )
                                      ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil('home_page', (route) => false);
                                  });
                                },
                                child: Container(
                                  height: 35,
                                  width: 90,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.shade400,
                                  ),
                                  child: Text("Delete",
                                  style: GoogleFonts.akshar(
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500
                                  ),
                                  ),
                                ),
                              )
                                    ],
                                  ),
                                )
                            );
                          });
                        },
                        child: ListTile(
                          tileColor: Colors.black38,
                          contentPadding: EdgeInsets.all(20),
                          splashColor: Colors.grey,
                          textColor: Colors.white,
                          title: Text("${weatherdata.name}",
                            style: GoogleFonts.akshar(
                                fontSize: 20
                            ),
                          ),
                          subtitle: Text(
                            "Mostly ${weatherdata.text}",
                            style: GoogleFonts.akshar(
                              letterSpacing: 0.5
                            ),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${weatherdata.temp_c}",
                                style: GoogleFonts.akshar(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

      ),
    );
  }
}
