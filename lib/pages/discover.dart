import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:pathika/commom/my_text.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  String _locationMessage = "Fetching location...";
  String _cityName = "";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationMessage = "Location services are disabled.";
      });
      return;
    }

    // Check for location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationMessage = "Location permissions are denied.";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _locationMessage = "Location permissions are permanently denied.";
      });
      return;
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _locationMessage =
          "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
    });

    // Reverse geocode to get the city name
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks[0];
      setState(() {
        _cityName = placemark.locality ?? "City not found";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: MyText("Explore",fontWeight: FontWeight.bold,fontSize: 35,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText("Current Location: $_cityName",fontSize: 17,),
              MyText(
                "Places To Vist Here",
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Material(borderRadius: BorderRadius.circular(24),
                      elevation: 10,
                      child: Container(
                        height: 320,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                width: 400,
                                height: 200,
                                child: Image.asset(
                                  "assets/bkt.jpg", fit: BoxFit.cover,
                                  // Ensure image covers container
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: MyText(
                                "Nyatapol",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: MyText(
                                "Bhaktapur,Nepal",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(

                                children: [
                                  SizedBox(width: 130,),
                                  ElevatedButton(

                                    onPressed: () {},style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.purple.shade300) ),
                                    child: MyText('See Location',color: Colors.white,),

                                  ),
                                ],
                              ),
                            )
                            /*  MyText("On gOing Tours"),
                                MyText("On gOing Tours")*/
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Material(borderRadius: BorderRadius.circular(24),
                      elevation: 10,
                      child: Container(
                        height: 320,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                width: 400,
                                height: 200,
                                child: Image.asset(
                                  "assets/pt.jpg", fit: BoxFit.cover,
                                  // Ensure image covers container
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: MyText(
                                "Patan Durbar Square",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: MyText(
                                "Patan,Nepal",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(

                                children: [
                                  SizedBox(width: 130,),
                                  ElevatedButton(

                                    onPressed: () {},style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.purple.shade300) ),
                                    child: MyText('See Location',color: Colors.white,),

                                  ),
                                ],
                              ),
                            )
                            /*  MyText("On gOing Tours"),
                                MyText("On gOing Tours")*/
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Row(
                      children: [
                        Material(borderRadius: BorderRadius.circular(24),
                          elevation: 10,
                          child: Container(
                            height: 320,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(24)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Container(
                                    width: 400,
                                    height: 200,
                                    child: Image.asset(
                                      "assets/sw.jpg", fit: BoxFit.cover,
                                      // Ensure image covers container
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: MyText(
                                    "Swayambhunath",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: MyText(
                                    "Kathmandu,Nepal",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(

                                    children: [
                                      SizedBox(width: 130,),
                                      ElevatedButton(

                                        onPressed: () {},style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.purple.shade300) ),
                                        child: MyText('See Location',color: Colors.white,),

                                      ),
                                    ],
                                  ),
                                )
                                /*  MyText("On gOing Tours"),
                                    MyText("On gOing Tours")*/
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MyText("On going fests here",fontWeight: FontWeight.bold,fontSize: 28,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(

                  children: [
                    Material(borderRadius: BorderRadius.circular(24),
                      elevation: 10,
                      child: Container(
                        height: 320,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                width: 400,
                                height: 200,
                                child: Image.asset(
                                  "assets/in.jpg", fit: BoxFit.cover,
                                  // Ensure image covers container
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: MyText(
                                "Indra Jatra",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: MyText(
                                "Bhaktapur,Nepal",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(

                                children: [
                                  SizedBox(width: 130,),
                                  ElevatedButton(

                                    onPressed: () {},style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.purple.shade300) ),
                                    child: MyText('See Location',color: Colors.white,),

                                  ),
                                ],
                              ),
                            )
                            /*  MyText("On gOing Tours"),
                                      MyText("On gOing Tours")*/
                          ],
                        ),
                      ),
                    ),
                    Material(borderRadius: BorderRadius.circular(24),
                      elevation: 10,
                      child: Container(
                        height: 320,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                width: 400,
                                height: 200,
                                child: Image.asset(
                                  "assets/lk.jpg", fit: BoxFit.cover,
                                  // Ensure image covers container
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: MyText(
                                "Lakhe Naach",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: MyText(
                                "Bhaktapur,Nepal",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(

                                children: [
                                  SizedBox(width: 130,),
                                  ElevatedButton(

                                    onPressed: () {},style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.purple.shade300) ),
                                    child: MyText('See Location',color: Colors.white,),

                                  ),
                                ],
                              ),
                            )
                            /*  MyText("On gOing Tours"),
                                      MyText("On gOing Tours")*/
                          ],
                        ),
                      ),
                    ),
                    Material(borderRadius: BorderRadius.circular(24),
                      elevation: 10,
                      child: Container(
                        height: 320,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                width: 400,
                                height: 200,
                                child: Image.asset(
                                  "assets/hl.jpg", fit: BoxFit.cover,
                                  // Ensure image covers container
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: MyText(
                                "Holi",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: MyText(
                                "Basantapur,Nepal",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(

                                children: [
                                  SizedBox(width: 130,),
                                  ElevatedButton(

                                    onPressed: () {},style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.purple.shade300) ),
                                    child: MyText('See Location',color: Colors.white,),

                                  ),
                                ],
                              ),
                            )
                            /*  MyText("On gOing Tours"),
                                      MyText("On gOing Tours")*/
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
