import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_provider/connectivity_provider.dart';
import '../../models/weather_model.dart';
import '../../weather_provider/weather_provider.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Provider.of<ConnectivityProvider>(context).connectivityModel.connectivitystatus == "Waiting.."
      ) ? const Center(
        child: Text("No data connection"),
      )
          : FutureBuilder(
          future: Provider.of<WeatherProvider>(context, listen: false)
              .Weatherdata(locationame: "Surat"),
          builder: (context,snapshot) {
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
              )
                  : Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://thumbs.gfycat.com/TerrificLightheartedGermanspaniel-size_restricted.gif"),
                      fit: BoxFit.cover,
                    ),
                  ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children:  [
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(weatherdata.name,
                                style: GoogleFonts.arapey(
                                  color: Colors.white,
                                  fontSize: 30,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(weatherdata.region,
                                  style: GoogleFonts.arapey(
                                    fontSize: 15,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  ),
                                  Text(
                                    ", ${weatherdata.country}",
                                    style: GoogleFonts.arapey(
                                      fontSize: 15,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              const Icon(CupertinoIcons.location,color: Colors.white
                              )
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('manage_city_page');
                                  },
                                  icon: const Icon(
                                   CupertinoIcons.building_2_fill,
                                   color: Colors.white,
                                  ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed('setting_page');
                                },
                                icon:  const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Expanded(
                        flex: 8,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 200),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Text("${weatherdata.temp_c}",
                                        style: GoogleFonts.akshar(
                                          fontSize: 65,
                                          color: Colors.white
                                        ),
                                          ),
                                      const SizedBox(width: 20),
                                      Column(
                                        children: [
                                          Text( "◦c",
                                          style: GoogleFonts.akshar(
                                            color: Colors.white,
                                            fontSize: 26
                                          ),
                                          ),
                                          Text("Mostly ${weatherdata.text}",
                                            style: GoogleFonts.akshar(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Text(weatherdata.localtime,
                                style: GoogleFonts.akshar(
                                  color: Colors.white,
                                ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      ...weatherdata.hour
                                      .map((e) => Padding(
                                          padding: const EdgeInsets.all(16),
                                        child: Column(
                                          children: [
                                            Text(
                                                e['time'].toString().split(" ")[1],
                                              style: GoogleFonts.akshar(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white
                                              ),
                                            ),
                                            Text(
                                              e['temp_c']
                                                  .toString(),
                                              style: GoogleFonts.akshar(
                                                  color:
                                                  Colors.white,
                                                  fontSize: 25
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      ).toList(),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Divider(color: Colors.white70,height: 2),
                                const SizedBox(height: 15),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text("Weather Details",
                                    style: GoogleFonts.akshar(
                                        color: Colors.white,
                                        fontSize: 22),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                const Divider(color: Colors.white70,height: 2),
                                const SizedBox(height: 10),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "Apparent Temperature",
                                            style: GoogleFonts.akshar(
                                              color: Colors.white70,
                                            ),
                                          ),
                                          Text(
                                            "${weatherdata.feelslike_c} ◦c"
                                                .toString(),
                                            style: GoogleFonts.akshar(
                                              fontSize: 30,
                                              color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 100),
                                      Column(
                                        children: [
                                          Text(
                                            "Humidity",
                                            style: GoogleFonts.akshar(
                                              color: Colors.white70,
                                            ),
                                          ),
                                          Text(
                                            "${weatherdata.humidity} %"
                                                .toString(),
                                            style: GoogleFonts.akshar(
                                              fontSize: 30,
                                              color: Colors.white,),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "SW Wind",
                                          style: GoogleFonts.akshar(
                                            color: Colors.white70,
                                          ),
                                        ),
                                        Text(
                                          " ${weatherdata.wind_kph} km/h"
                                              .toString(),
                                          style: GoogleFonts.akshar(
                                            fontSize: 30,
                                            color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 120),
                                    Column(
                                      children: [
                                        Text(
                                          "UV",
                                          style: GoogleFonts.akshar(
                                            color: Colors.white70,
                                          ),
                                        ),
                                        Text(
                                          "${weatherdata.uv}"
                                              .toString(),
                                          style: GoogleFonts.akshar(
                                            fontSize: 30,
                                            color: Colors.white,),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 40),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 5),
                                      Column(
                                        children: [
                                          Text(
                                            "Visibility",
                                            style: GoogleFonts.akshar(
                                              color: Colors.white70,
                                            ),
                                          ),
                                          Text(
                                            "${weatherdata.vis_km} km"
                                                .toString(),
                                            style: GoogleFonts.akshar(
                                              fontSize: 30,
                                              color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 80),
                                      Column(
                                        children: [
                                          Text(
                                            "Air Pressure",
                                            style: GoogleFonts.akshar(
                                              color: Colors.white70,
                                            ),
                                          ),
                                          Text(
                                            "${weatherdata.pressure_mb} hPa".toString(),
                                            style: GoogleFonts.akshar(
                                              fontSize: 30,
                                              color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                ),
              );
            }
            return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                ),
            );
          }
          )
    );
  }
}
