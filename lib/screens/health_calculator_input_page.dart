import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:swayambhu_wellness/screens/result_page.dart';
import '../components/bottom_button.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import '../utils/calculator_brain.dart';
import '../utils/constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late Gender selectedGender = Gender.male;
  bool isSelected = false;
  int height = 180;
  int weight = 60;
  int age = 20;

  // bool ageMinusButtonDisabled = true;

  @override
  Widget build(BuildContext context) {
    var ageMinusButtonDisabled = false;
    var weightMinusButtonDisabled = false;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('HEALTH CALCULATOR'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 200,
                width: 200,
                child: Lottie.network(
                    'https://assets5.lottiefiles.com/packages/lf20_5njp3vgg.json'),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: IconContent(
                          genderIcon: FontAwesomeIcons.mars,
                          genderText: 'पुरुष',
                        ),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        border: selectedGender == Gender.male
                            ? Border.all(
                          color: Colors.orangeAccent,
                          width: 3.0,
                        )

                            : null,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: IconContent(
                          genderIcon: FontAwesomeIcons.venus,
                          genderText: 'स्त्री',
                        ),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        border: selectedGender == Gender.female
                            ? Border.all(
                          color: Colors.orangeAccent,
                          width: 3.0,
                        )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'उंची',
                              style: kLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  height.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Text(
                                  'cm',
                                  style: kLabelTextStyle,
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 2.0,
                                activeTrackColor: Colors.white60,
                                thumbColor: Colors.white60,
                                overlayColor: Colors.white30,
                                inactiveTrackColor: Color(0xFF8D8E98),
                                thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                                overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 24.0),
                              ),
                              child: Slider(
                                value: height.toDouble(),
                                min: 120.0,
                                max: 250.0,
                                divisions: 250,
                                label: height.round().toString(),
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.round();
                                  });
                                },
                              ),
                            )
                          ],
                        ), onPress: () {  },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'वजन',
                            style: kLabelTextStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  weight.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Text(
                                  'kg',
                                  style: kLabelTextStyle,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // RoundIconButton(
                              //   icon: Icons.remove,
                              //   onPressed: () {
                              //     setState(() {
                              //       weight--;
                              //     });
                              //   },
                              // ),
                              AbsorbPointer(
                                absorbing: weightMinusButtonDisabled,
                                child: RoundIconButton(
                                  icon: Icons.remove,
                                  onPressed: () {
                                    setState(() {
                                      if (weight == 10) {
                                        weightMinusButtonDisabled = true;
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                title: const Text(
                                                    'किमान वजन गाठले!'),
                                                content: const Text(
                                                    '10 पेक्षा कमी वजनासाठी गणना करू शकत नाही.'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context, 'OK'),
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              ),
                                        );
                                      } else {
                                        weight--;
                                        weightMinusButtonDisabled = false;
                                      }
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ), onPress: () {  },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'वय',
                            style: kLabelTextStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // RoundIconButton(
                              //   icon: Icons.remove,
                              //   onPressed: () {
                              //     setState(() {
                              //       age--;
                              //     });
                              //   },
                              // ),
                              AbsorbPointer(
                                absorbing: ageMinusButtonDisabled,
                                child: RoundIconButton(
                                  icon: Icons.remove,
                                  onPressed: () {
                                    setState(() {
                                      if (age == 10) {
                                        ageMinusButtonDisabled = true;
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                title:
                                                const Text('किमान वय गाठले!'),
                                                content: const Text(
                                                    '10 पेक्षा कमी वयाची गणना करू शकत नाही.'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context, 'OK'),
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              ),
                                        );
                                      } else {
                                        age--;
                                        ageMinusButtonDisabled = false;
                                      }
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                    // ageMinusButtonDisabled = false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ), onPress: () {  },
                    ),
                  ),
                ]),
              ),
              BottomButton(
                  buttonText: 'CALCULATE',
                  onTap: () {
                    if (selectedGender == null) {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('लिंग निवडले नाही!'),
                          content: const Text('कृपया प्रथम लिंग निवडा.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      CalculatorBrain calc = CalculatorBrain(
                        height: height,
                        weight: weight,
                        age: age,
                        gender: selectedGender,
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ResultsPage(
                              bmiResults: calc.calculateBMI(),
                              bmiResultText: calc.getBMIResult(),
                              idealWeight: calc.calculateIdealWeight(),
                              // bmiInterpretation: calc.getBMIInterpretation(),
                              bfpResults: calc.calculateBFP(),
                              bfpResultText: calc.getBFPResult(),
                              bmrResults: calc.calculateBMR(),
                            );
                          },
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
