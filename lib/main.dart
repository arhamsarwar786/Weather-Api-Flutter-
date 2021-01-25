import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import './cities.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // final _index;
    return MaterialApp(
      home: MainPage(14),
    );
    }
  }

  //////////////////    2nd Class     ////////////////////////////////

  class MainPage extends StatefulWidget {
    final _index;
    MainPage(this._index);
  @override
  _MainPageState createState() => _MainPageState(_index);
}

class _MainPageState extends State<MainPage> {
  var _index;
  _MainPageState(this._index);
  static double temp = 0, tempp = 0, windSpeed = 0, lon = 0, lan = 0;

  static var cityName = 'Lahore', weather = 'Clear', weatherImg = 'clear.jpg';
  static int humidity = 0, clouds = 0, pressure = 0;
  var cities = [
    "Attock",
    "Bahawalpur",
    "Burewala",
    "Chakwal",
    "Chiniot",
    "Dera Ghazi Khan",
    "Faisalabad",
    "Gujar Khan",
    "Gujranwala",
    "Gujrat",
    "Jhang",
    "Jhelum",
    "Kasur",
    "Kharian",
    "Lahore",
    "Mianwali",
    "Multan",
    "Murree",
    "Okara",
    "Rahim Yar Khan",
    "Rawalpindi",
    "Sadiqabad",
    "Sahiwal",
    "Sargodha",
    "Sheikhupura",
    "Sialkot",
    "Taxila",
    "Toba Tek Singh"
        "Badin",
    "Hyderabad",
    "Jacobabad",
    "Karachi",
    "Khairpur",
    "Larkana",
    "Mirpur Khas",
    "Nawabshah",
    "Sukkur",
    "Thatta",
    "Abbottabad",
    "Bannu",
    "Battagram",
    "Chitral",
    "Charsadda",
    "D.I.Khan",
    "Haripur",
    "Kohat",
    "Mansehra",
    "Mardan",
    "Nowshera",
    "Peshawar",
    "Swat",
    "Swabi",
    "Timergara",
    "Tank",
    "Chaman",
    "Gwadar",
    "Khuzdar",
    "Quetta",
    "Ziarat",
    "Bagh",
    "Bhimber",
    "Kotli",
    "Mirpur",
    "Muzaffarabad",
    "Rawalakot",
    "Gilgit",
    "Skardu",
  ];

  //  clouds = 0, pressure = 0, lon = 0, lan = 0;

  @override
  void initState() {
    gettingDataFun();
    super.initState();
    print("Wotking");
  }

  Future<void> gettingDataFun() async {
    print("This Funtions is Working Fine But this Issue with Api");
    var apiKey = 'b189f31bd264510e4848acac84074ab4';
    setState(() {
      cityName = cities[_index];
    });
    dynamic response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey");
    // print("After Response");
    // print("Response is Given Here : ${response.body}");

    var de = json.decode(response.body);

    windSpeed = de['wind']['speed'];
    humidity = de['main']['humidity'];
    clouds = de['clouds']['all'];
    pressure = de['main']['pressure'];
    lon = de['coord']['lon'];
    lan = de['coord']['lat'];

    // de ? Text("Arham") : CircularProgressIndicator();

    if (response.statusCode == 200) {
      tempp = de['main']['temp'];
      cityName = de['name'];
      weather = de['weather'][0]['main'];
      print(weather);
      if (weather == 'Clear') {
        weatherImg = 'clear.jpg';
      } else if (weather == 'Smoke') {
        weatherImg = 'mist.jpeg';
      } else if (weather == 'Clouds') {
        weatherImg = 'cloud.jpg';
      } else if (weather == 'Mist') {
        weatherImg = 'Mist1.jpeg';
      } else if (weather == 'Haze') {
        weatherImg = 'haze.webp';
      } else if (weather == 'Rain') {
        weatherImg = 'rain.jpeg';
      } else if (weather == 'Clear') {
        weatherImg = 'clear.jpg';
      } else if (weather == 'Thander') {
        weatherImg = 'thander.jpg';
      }
    }
    // print(de['main']['temp']);
    else {
      print("No Reponse Recived");
    }

    temp = tempp;
    // myFinalTemp = temp;
    print(de);
  }

  @override
  Widget build(BuildContext context) {
    var finalTemp = 0.0, finalmy;
    setState(() {
      finalTemp = temp - 273;
      finalmy = finalTemp.round();
    });

    var totalSize = MediaQuery.of(context).size;
    var height = totalSize.height;
    var width = totalSize.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.black,
      drawer: Drawer(),
      // appBar:
      body: Container(
        height: height,
        child: RefreshIndicator(
          onRefresh: gettingDataFun,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'images/$weatherImg',
                fit: BoxFit.cover,
              ),
              ListView(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    // height: height * 0.40,
                    child: AppBar(
                      // toolbarHeight: 30,
                      actions: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectCity(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          iconSize: 30,
                        ),
                      ],
                      backgroundColor: Colors.black45,

                      elevation: 0.0,
                      // iconTheme: IconThemeData(color: Colors.red),
                      shadowColor: Colors.transparent,
                      title: Text(
                        "$cityName",
                        style: TextStyle(
                          fontFamily: "Acme",
                          fontSize: 25,
                        ),
                      ),
                      centerTitle: true,
                    ),
                  ),
                  Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        // color: Colors.red,
                        //   gradient: LinearGradient(
                        //     begin: AlignmentDirectional.topCenter,
                        //     end: Alignment.bottomCenter,
                        //     // colors: [
                        //     //   Colors.red[100],

                        //     //   // Colors.blue[300],
                        //     //   Colors.blue[300],
                        //     // ],
                        //   ),
                        ),
                    child: Container(
                      height: height,
                      color: Colors.black45,
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.47,
                            width: width,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 28.0, left: 30, right: 30),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "$finalmy",
                                              style: TextStyle(
                                                  fontSize: 100,
                                                  fontFamily: "Acme",
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "°",
                                              style: TextStyle(
                                                  fontSize: 50,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "$weather",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: "FiraSans",
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // color: Colors.red,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "24 Hours",
                                          style: TextStyle(
                                              fontFamily: "Acme",
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          "5/16",
                                          style: TextStyle(
                                              fontFamily: "Acme",
                                              color: Colors.white,
                                              fontSize: 25),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 30),
                            width: width * 0.50,
                            height: height * 0.30,
                            color: Colors.black26,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        "Wind Speed : ",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontFamily: "Acme",
                                        ),
                                      ),
                                      trailing: Text(
                                        '$windSpeed',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Acme",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        "Humidity : ",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontFamily: "Acme",
                                        ),
                                      ),
                                      trailing: Text(
                                        '$humidity',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Acme",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        "Clouds : ",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontFamily: "Acme",
                                        ),
                                      ),
                                      trailing: Text(
                                        '$clouds',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Acme",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        "Pressure : ",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontFamily: "Acme",
                                        ),
                                      ),
                                      trailing: Text(
                                        '$pressure',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Acme",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        "Lontitude : ",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontFamily: "Acme",
                                        ),
                                      ),
                                      trailing: Text(
                                        '$lon',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Acme",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        "Lantitiude : ",
                                        style: TextStyle(
                                          fontFamily: "Acme",
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      trailing: Text(
                                        '$lan',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Acme",
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
