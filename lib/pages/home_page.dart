import 'package:flutter/material.dart';
import 'package:pathika/components/carousel.dart';

import '../commom/my_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Row(
          children: [
            CircleAvatar(radius: 25, child: Icon(Icons.person)),
            SizedBox(width: 20,),
            Column(
              children: [
                MyText("Hello Ritnesh,"),
                MyText(
                  "Madhyapur Thimi",
                  fontSize: 15,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                "Places To Visit",
                fontSize: 20,
              ),
              SizedBox(
                height: 10,
              ),
              Carousel(),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Icon(
                            Icons.airplanemode_active,
                            size: 50,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Icon(
                            Icons.food_bank,
                            size: 50,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Icon(
                            Icons.hotel,
                            size: 50,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(24),
                elevation: 10,
                child: Container(
                  height: 320,
                  width: 500,
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
                            "assets/kn.jpg", fit: BoxFit.cover,
                            // Ensure image covers container
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: MyText(
                          "Mt.Kanchanjunga",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: MyText(
                          "Taplejung,Nepal",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.purple.shade300)),
                              child: MyText(
                                'See Options',
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: 45,
                              width: 140,
                              decoration: BoxDecoration(
                                  color: Colors.purple.shade300,
                                  borderRadius: BorderRadius.circular(23)),
                              child: Center(
                                  child: MyText(
                                "Budget:1000",
                                color: Colors.white,
                              )),
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
              SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(24),
                elevation: 10,
                child: Container(
                  height: 320,
                  width: 500,
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
                          "Paan Tale Mandir",
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.purple.shade300)),
                              child: MyText(
                                'See Options',
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: 45,
                              width: 140,
                              decoration: BoxDecoration(
                                  color: Colors.purple.shade300,
                                  borderRadius: BorderRadius.circular(23)),
                              child: Center(
                                  child: MyText(
                                "Budget:10000",
                                color: Colors.white,
                              )),
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
              Material(
                borderRadius: BorderRadius.circular(24),
                elevation: 10,
                child: Container(
                  height: 320,
                  width: 500,
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
                            "assets/an.jpg", fit: BoxFit.cover,
                            // Ensure image covers container
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: MyText(
                          "Mt.Annapurna",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: MyText(
                          "Gandaki,Nepal",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.purple.shade300)),
                              child: MyText(
                                'See Options',
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: 45,
                              width: 140,
                              decoration: BoxDecoration(
                                  color: Colors.purple.shade300,
                                  borderRadius: BorderRadius.circular(23)),
                              child: Center(
                                  child: MyText(
                                "Budget:1000",
                                color: Colors.white,
                              )),
                            )
                          ],
                        ),
                      )
                      /*  MyText("On gOing Tours"),
                      MyText("On gOing Tours")*/
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(24),
                elevation: 10,
                child: Container(
                  height: 320,
                  width: 500,
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
                            "assets/ev.jpg", fit: BoxFit.cover,
                            // Ensure image covers container
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: MyText(
                          "Mt.Everest",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: MyText(
                          "Taplejung,Nepal",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.purple.shade300)),
                              child: MyText(
                                'See Options',
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: 45,
                              width: 140,
                              decoration: BoxDecoration(
                                  color: Colors.purple.shade300,
                                  borderRadius: BorderRadius.circular(23)),
                              child: Center(
                                  child: MyText(
                                "Budget:1000",
                                color: Colors.white,
                              )),
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
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
