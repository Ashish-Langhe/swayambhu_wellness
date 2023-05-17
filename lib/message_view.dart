import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import 'main.dart';

class CreateMessageView extends StatefulWidget {
  const CreateMessageView(Key key, this.title) : super(key: key);
  final String title;

  @override
  _CreateMessageViewState createState() => _CreateMessageViewState();
}

class _CreateMessageViewState extends State<CreateMessageView> {
  final mobileNumberController = TextEditingController();
  final descriptionController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  String processedText = "";

  @override
  void dispose() {
    mobileNumberController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldMessenger(
        key: scaffoldKey,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            title: Text(widget.title),
            // backgroundColor: Colors.green
          ),
          body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/resources/bg_img.png",),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Lottie.network('https://assets3.lottiefiles.com/packages/lf20_0nnf0are/data.json'),
                    // Image.asset("lib/resources/whatssapp.jpeg",
                    //   width: 600,
                    //   height: 400,
                    // ),
                    TextFormField(
                      controller: mobileNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'मोबाईल नंबर',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey[800],
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      controller: descriptionController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'माहिती जोडा',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey[800],
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _onSubmitPressed,
                      child: Text('कॉपी करा'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  void _onSubmitPressed() {
    String mobileNumber = mobileNumberController.text;
    String description = descriptionController.text;

    if (mobileNumber.isEmpty) {
      scaffoldKey.currentState?.showSnackBar(const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text('कृपया मोबाईल नंबर प्रविष्ट करा'),
      ));
      return;
    }

    if (description.isEmpty) {
      scaffoldKey.currentState?.showSnackBar(const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text('कृपया मजकूर प्रविष्ट करा'),
      ));
      return;
    }

    setState(() {
      descriptionController.text = URLify("https://api.whatsapp.com/send?phone=91$mobileNumber&text=$description");
      processedText =
          URLify("https://api.whatsapp.com/send?phone=91$mobileNumber&text=$description");
      descriptionController.clear();
      mobileNumberController.clear();
    });

    _onCopyPressed();
  }


  String URLify(String text) {
    return text.replaceAll(RegExp(' '), '%20');
  }
  void _onCopyPressed() {
    Clipboard.setData(ClipboardData(text: processedText));
    scaffoldKey.currentState?.showSnackBar(const SnackBar(
      backgroundColor: Colors.green,
      content: Text('तुमचा मजकूर कॉपी केला आहे, आता तो कुठेही वापरा किंवा शेअर करा'),
    ));
  }
}