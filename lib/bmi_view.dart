import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swayambhu_wellness/main.dart';

class BmiView extends StatelessWidget {
  final String userName;
  BmiView(this.userName);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalculator(this.userName),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  String userName;
  BmiCalculator(this.userName);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentindex = 0;
  var weightController = TextEditingController();
  var feetController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  var backgroundColour;
  double bmi_result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            title: Text("Check BMI")
          // backgroundColor: Colors.green
        ),
        //Body of the app
        body: SingleChildScrollView(
          child: Container(
            color: backgroundColour,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 3000,
                  color: Colors.lime,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "कृपया तुमचा BMI येथे तपासा",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Center(
                  child: Container(
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "BMI",
                          style: TextStyle(
                              fontSize: 34, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: weightController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'तुमचे वजन प्रविष्ट करा (in Kg)',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              prefixIcon: Icon(Icons.line_weight, color: Colors.grey[400]),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[300]!),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: feetController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'तुमची उंची प्रविष्ट करा (in Feet)',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              prefixIcon: Icon(Icons.height, color: Colors.grey[400]),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[300]!),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: inchController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'तुमची उंची प्रविष्ट करा (in Inches)',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              prefixIcon: Icon(Icons.height, color: Colors.grey[400]),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[300]!),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                            ),
                          ),
                        ),

                        SizedBox(height: 25),
                        ElevatedButton(
                          onPressed: () {
                            var wt = weightController.text.toString();
                            var ft = feetController.text.toString();
                            var inch = inchController.text.toString();

                            if (wt != "" && ft != "" && inch != "") {
                              //BMI Calculation
                              var iWt = int.parse(wt);
                              var iFt = int.parse(ft);
                              var iInch = int.parse(inch);

                              var tInch = (iFt * 12) + iInch;
                              var tCm = tInch * 2.54;
                              var tM = tCm / 100;

                              var bmi = iWt / (iFt * tM);
                              var msg = "";

                              setState(() {
                                bmi_result = iWt / (iFt * tM);
                              });

                              if (bmi < 18.5) {
                                msg = "तुमचे वजन कमी आहे!!";
                                backgroundColour = Colors.red.shade200;
                              } else if (bmi < 25) {
                                msg = "तुम्ही निरोगी आहात!!";
                                backgroundColour = Colors.green.shade200;
                              } else if (bmi < 30) {
                                msg = "तुमचे वजन जास्त आहे!!";
                                backgroundColour = Colors.orange.shade200;
                              } else if (bmi < 35) {
                                msg = "तुमचे वजन जास्त आहे आणि चांगले नाहीत!!";
                                backgroundColour = Colors.orange.shade300;
                              } else if (bmi < 40) {
                                msg = "तुमचे वजन अतिशय जास्त आहे आणि खतरनाक आहे!!";
                                backgroundColour = Colors.red.shade300;
                              } else {
                                msg = "तुमचे वजन अत्यंत जास्त आहे आणि अत्यंत खतरनाक आहे!!";
                                backgroundColour = Colors.red.shade500;
                              }

                              setState(() {
                                result =
                                "$msg \n ${widget.userName} तुमचा BMI ${bmi.toStringAsFixed(2)} आहे ";
                              });
                            } else {
                              //Warning Required missing fields
                              setState(() {
                                result =
                                "कृपया सर्व आवश्यक माहिती भरा!!";
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                            child: const Text(
                              "Calculate",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 150),
                        CustomPaint(
                          size: Size(200, 20),
                          painter: BMIPainter(bmi: bmi_result),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: (result.length <= 0) ? null :  BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            result,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "निरोगी BMI श्रेणी: 18.5 kg/m² - 25 kg/m²",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            color: Colors.grey[700],
                            fontStyle: FontStyle.italic,
                            decorationThickness: 2,
                          ),
                        ),
                        SizedBox(height: 110)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class BMIPainter extends CustomPainter {
  final double bmi;

  BMIPainter({required this.bmi});

  @override
  void paint(Canvas canvas, Size size) {
    double percentage = bmi / 50;
    double arcAngle = percentage * 2 * pi;
    Paint backgroundPaint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke;
    Paint circlePaint = Paint()
      ..color = _getBMIColor()
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, backgroundPaint);
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2), -pi / 2,
        arcAngle, false, circlePaint);
    _drawObesityLevelText(canvas, size);
    _drawBMIText(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  Color _getBMIColor() {
    if (bmi < 18.5) {
      return Colors.blue;
    } else if (bmi >= 18.5 && bmi < 25) {
      return Colors.green;
    } else if (bmi >= 25 && bmi < 30) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  void _drawObesityLevelText(Canvas canvas, Size size) {
    String obesityLevel = _getObesityLevel();
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: obesityLevel,
        style: TextStyle(
          color: _getBMIColor(),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: size.width);
    Offset textOffset = Offset(size.width / 2 - textPainter.width / 2,
        size.height / 2 - textPainter.height / 2 - 8);
    textPainter.paint(canvas, textOffset);
  }

  void _drawBMIText(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: bmi.toStringAsFixed(1),
        style: TextStyle(
          color: _getBMIColor(),
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: size.width);
    Offset textOffset = Offset(size.width / 2 - textPainter.width / 2,
        size.height / 2 - textPainter.height / 2 + 16);
    textPainter.paint(canvas, textOffset);
  }

  String _getObesityLevel() {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Normal weight";
    } else if (bmi >= 25 && bmi < 30) {
      return "Overweight";
    } else if (bmi >= 30 && bmi < 35) {
      return "Obese class I";
    } else if (bmi >= 35 && bmi < 40) {
      return "Obese class II";
    } else {
      return "Obese class III";
    }
  }

}