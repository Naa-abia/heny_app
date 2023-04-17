import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyIntroPage1 extends StatelessWidget {
  const MyIntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            "https://assets5.lottiefiles.com/private_files/lf30_5i5tlydx.json"),
      ),
    );
  }
}
