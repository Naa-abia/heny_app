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
                image: const AssetImage('assets/images/splash_background.jpg'),
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
              //used .only  to add padding to the bottom edge  to move it away from the bottom of the screen and create some space between the text and the centered button.
              padding: const EdgeInsets.only(
                left: 16.0,
                bottom: 100.0,
              ),

              child: Column(
                //useful when you want to align the children in the center or in a specific position along the main axis
                mainAxisSize: MainAxisSize.min,

                // used to align the Text widgets in the Column to the start edge of the horizontal axis, which is the left edge of the screen
                crossAxisAlignment: CrossAxisAlignment.start,

                children: const [
                  Text(
                    'Lets make',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'your dream',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'a vacation',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //for the button that is centered at the bottom
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 24.0,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your onPressed action here
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(
                          255, 245, 174, 108), // Set the text color
                      minimumSize: const Size(double.infinity,
                          50), // Set the button width to fill the available space horizontally

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )))
        ]));
  }
}
