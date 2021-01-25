import 'package:flutter/material.dart';
import 'package:weatherapi/main.dart';

class SelectCity extends StatefulWidget {
  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  @override
  Widget build(BuildContext context) {
    var totalSize = MediaQuery.of(context).size;

    var height = totalSize.height;
    var width = totalSize.width;
    var _index;
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Select City",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: height,
        width: width,
        // child: Column(
        //   children: [
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Container(
        //     height: 40,
        //     child: TextField(
        //       decoration: InputDecoration(
        //         hintText: "City",
        //         border: OutlineInputBorder(),
        //       ),
        //     ),
        //   ),
        // ),
        child: ListView.builder(
          itemBuilder: (context, i) => Container(
            child: ListTile(
              title: Text(cities[i]),
              onTap: () {
                _index = i;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(_index),
                  ),
                );
              },
            ),
          ),
          itemCount: cities.length,
        ),
        //   ],
        // ),
      ),
    );
  }
}
