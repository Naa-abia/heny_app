import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //this was imported after the statusbar came in

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // Setting the system overlay style to light on a transparent status bar
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));

    return Scaffold(
      //to add an image background with text on top of it , we need a Stack
      body: Stack(
          //children because we going to have different element types
          children: [
            //container because the image will have
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      const AssetImage('assets/images/splash_background.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),

            Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 400,
                    child: Column(
                      children: const [
                        Text(
                          'Lets make',
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'your dream',
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'a vacation',
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),

            //for the button that is centered
            Center(
                child: ElevatedButton(
              onPressed: () {
                // Add your onPressed action here
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(
                    255, 245, 174, 108), // Set the button background color
                onPrimary: Colors.white, // Set the text color
                minimumSize: const Size(double.maxFinite,
                    50), // Set the button width to fill the available space horizontally
              ),
              child: const Text('Click me'),
            ))
          ]),
    );
  }
}
