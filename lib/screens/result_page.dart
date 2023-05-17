

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../utils/constants.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResults;
  final String bmiResultText;
  final String idealWeight;
  final String bfpResults;
  final String bfpResultText;
  final String bmrResults;

  ResultsPage(
      {required this.bmiResults,
        required this.bmiResultText,
        required this.idealWeight,
        required this.bfpResults,
        required this.bfpResultText,
        required this.bmrResults});

  Color getBMIResultTextColor() {
    if (bmiResultText == 'overweight') {
      return Colors.red;
    } else if (bmiResultText == 'normal') {
      return Color(0xFF24D876);
    } else if (bmiResultText == 'underweight') {
      return Colors.yellow;
    } else {
      return Colors.white;
    }
  }

  Object _getObesityLevel() {
    double bmiResultsInt = double.parse(bmiResults);
    if (bmiResultsInt < 18.5) {
      return Lottie.network("https://assets5.lottiefiles.com/packages/lf20_qaf4fr8n.json");
    } else if (bmiResultsInt >= 18.5 && bmiResultsInt < 25) {
      return Lottie.network("https://assets5.lottiefiles.com/packages/lf20_kOvJ8c/normal/data.json");
    } else if (bmiResultsInt >= 25 && bmiResultsInt < 30) {
      return Lottie.network("https://assets5.lottiefiles.com/packages/lf20_3ejhEJ/over/data.json");
    } else if (bmiResultsInt >= 30 && bmiResultsInt < 35) {
      return Lottie.network("https://assets5.lottiefiles.com/packages/lf20_pOCvY7/obeso/data.json");
    } else if (bmiResultsInt >= 35 && bmiResultsInt < 40) {
      return Lottie.network("https://assets5.lottiefiles.com/packages/lf20_pOCvY7/obeso/data.json");
    } else {
      return Lottie.network("https://assets5.lottiefiles.com/packages/lf20_e2MF8p/morbid-obesity/data.json");
    }
  }

  String getBMIResultLottie() {
    if (bmiResultText == 'overweight') {
      return "https://assets5.lottiefiles.com/packages/lf20_3ejhEJ/over/data.json";
    } else if (bmiResultText == 'normal') {
      return "https://assets5.lottiefiles.com/packages/lf20_kOvJ8c/normal/data.json";
    } else if (bmiResultText == 'underweight') {
      return "Colors.yellow";
    } else {
      return "Colors.white";
    }
  }
  Color getBFPResultTextColor() {
    if (bfpResultText == 'Very Low!') {
      return Colors.red;
    } else if (bfpResultText == 'Excellent') {
      return Color(0xFF24D876);
    } else if (bfpResultText == 'Good') {
      return Color(0xFF24D876);
    } else if (bfpResultText == 'Fair') {
      return Colors.yellow;
    } else if (bfpResultText == 'High') {
      return Colors.red;
    } else if (bfpResultText == 'Very High!') {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YOUR RESULTS'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: SizedBox(
                    height: 200,
                    width: 200,
                    child: _getObesityLevel() as Widget),
              ),
              Expanded(
                flex: 2,
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            'BMI',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            '(Body Mass Index)',
                            style: kSmallLabelTextStyle,
                          ),
                        ],
                      ),
                    //  Lottie.network(_getObesityLevel()),
                      Text(
                        bmiResultText.toUpperCase(),
                        style: TextStyle(
                          color: getBMIResultTextColor(),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2.0,
                        ),
                      ),
                      Text(
                        bmiResults,
                        style: kBMITextStyle,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Normal BMI Range: ',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '18.5 - 25 kg/m2',
                            style: kBodyTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ), onPress: () {  },
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'BFP',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              '(Body Fat Percentage)',
                              style: kSmallLabelTextStyle,
                            ),
                            Text(
                              bfpResultText,
                              style: TextStyle(
                                color: getBFPResultTextColor(),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 2.0,
                              ),
                            ),
                            Text(
                              bfpResults,
                              style: kBMITextStyle,
                            ),
                          ],
                        ), onPress: () {  },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'BMR',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              '(Basal Metabolic Rate)',
                              style: kSmallLabelTextStyle,
                            ),
                            Text(
                              'Calories per day',
                              style: kResultTextStyle,
                            ),
                            Text(
                              bmrResults,
                              style: kBMITextStyle,
                            ),
                          ],
                        ), onPress: () {  },
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(
                buttonText: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
