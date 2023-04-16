import 'package:flutter/material.dart';
import 'package:heny_app/intro_screens/intro_screen1.dart';
import 'package:heny_app/intro_screens/intro_screen2.dart';
import 'package:heny_app/intro_screens/intro_screen3.dart';
import 'package:heny_app/list_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyOnboardPage extends StatefulWidget {
  const MyOnboardPage({super.key, required this.title});

  final String title;

  @override
  State<MyOnboardPage> createState() => _MyOnboardPageState();
}

class _MyOnboardPageState extends State<MyOnboardPage> {
//to keep track of the page we on we need the controller

  final PageController _controller = PageController();

  //if we on the last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //this gives me the three page slides
        body: Stack(
      children: [
        PageView(
          //giving the page the controller option
          controller: _controller,

          //for the change on the text on the last page
          onPageChanged: (index) {
            setState(() {
              //this shows that if the index is 2 then we on the last page
              onLastPage = (index == 2);
            });
          },

          children: const [
            MyIntroPage1(),
            MyIntroPage2(),
            MyIntroPage3(),
          ],
        ),

        //putting in dotindicators for the bottom of the screen

        // ignore: avoid_unnecessary_containers
        Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              //to get the text of the skip and next to space out evenly
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: const Text("SKIP")),

                //this is for the dot indicators
                SmoothPageIndicator(controller: _controller, count: 3),

                //next or done for last screen
                //the widget here allows you to make tapping work
                onLastPage ? //checking if on last page is true .
                GestureDetector(
                    onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) {
                      return const ListPage ();
                    }));
                    },
                    child: const Text("DONE"),
                )
                    
                    : GestureDetector(
                    onTap: () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: const Text("NEXT"))
              ],
            ))
      ],
    ));
  }
}
