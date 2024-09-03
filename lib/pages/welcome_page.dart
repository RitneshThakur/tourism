//38:58
import 'package:flutter/material.dart';
import 'package:tourismapp/widgets/app_large_text.dart';
import 'package:tourismapp/widgets/app_text.dart';
import 'package:tourismapp/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images =[
    "0.png",
    "k.png",
    "s.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index){
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "img/"+ images[index]
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Trips"),
                        AppText(text: "Mountain", size: 30,),
                        SizedBox(height:20 ,),
                        Container(
                          width: 250,
                          child: AppText(
                            text: "Mountain hikes give you an incredible sense of freedom along with endurance",
                            size: 14,
                          ),
                        ),

                        SizedBox(height:40 ,),
                        ResponsiveButton(width: 120,),

                      ],
                    ),

                    Column(
                      children: List.generate(3, (indexDots){
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index== indexDots? 25: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index== indexDots?Colors.deepPurple: Colors.deepPurple.withOpacity(0.3),
                          ),
                        );

                      }),
                    ),

                  ],
                ),

              ),
            );
          }),
    );
  }
}