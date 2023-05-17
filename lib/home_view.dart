import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:swayambhu_wellness/gallery_view.dart';
import 'package:swayambhu_wellness/screens/health_calculator_input_page.dart';
import 'bmi_view.dart';
import 'message_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({Key? key}) : super(key: key);

  @override
  State<MyHomeView> createState() => _HomeState();
}

class _HomeState extends State<MyHomeView> {
  @override
  Widget build(BuildContext context) {

    final List<String> imageUrls = [
     "lib/resources/wellness.jpeg",
      "lib/resources/wellness_c.png",
      "lib/resources/yoga.png",
      "lib/resources/health_tip_1.png",
      "lib/resources/health_tip_2.png",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Swayambhu Wellness Studio"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 15),
              CarouselSlider(
                items: imageUrls
                    .map(
                      (url) => Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(url),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ).toList(),
                options: CarouselOptions(
                  height: 250.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 50),
                  viewportFraction: 0.8,
                  pageSnapping: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "स्वयंभू वेलनेसमध्ये तुमचे स्वागत आहे",
                    style:
                    TextStyle(
                      color: Colors.green,
                        fontSize: 20, fontWeight: FontWeight.w900),

                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.monitor_heart_rounded, color: Colors.white),
                        SizedBox(width: 15),
                        Text(
                          "तुमचे आरोग्य तपासा",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InputPage()),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.edit_note, color: Colors.white),
                        SizedBox(width: 15),
                        Text(
                          "संदेश तयार करा",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const CreateMessageView(Key(""), "संदेश तयार करा"),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.add_circle_sharp, color: Colors.white),
                        SizedBox(width: 15),
                        Text(
                          "नवीन सदस्याची माहिती जोडा",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      const url = 'https://docs.google.com/forms/d/e/1FAIpQLSe6_8c4OLAn8Xi3usftZUR3bSuSofIpsd1kkBolO2hXHxiw9Q/viewform'; // Replace with your Google form URL
                      FlutterWebBrowser.openWebPage(
                        url: url,
                      );
                    },
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SizedBox(
              //     width: 250,
              //     height: 60,
              //     child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         primary: Colors.blue,
              //       ),
              //       child: Row(
              //         children: const [
              //           Icon(Icons.edit_note, color: Colors.white),
              //           SizedBox(width: 15),
              //           Text(
              //             "Fitness Results",
              //             style: TextStyle(color: Colors.white),
              //           ),
              //         ],
              //       ),
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(builder: (context) => GalleryView()),
              //         );
              //       },
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 50),
                child: Image.asset("lib/resources/home_img.png",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
