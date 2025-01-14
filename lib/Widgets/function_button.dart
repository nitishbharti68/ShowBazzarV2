
import 'package:flutter/material.dart';

//for Sign in, Continue button

class FunctionButton extends StatelessWidget {
  const FunctionButton({
    super.key,  this.landingScreen, required this.textForButton, this.onPressed
  });

  final landingScreen;
  final String textForButton;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      margin: const EdgeInsets.symmetric(horizontal: 60),
      decoration: BoxDecoration(
        color: Colors.blue.shade400,
        borderRadius: BorderRadius.circular(25),

      ),
      child: TextButton(onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => landingScreen,
          ),
        );
      }, child:  Center(
        child: Text(
          textForButton,
          style: const TextStyle(
              color: Colors.white, fontSize: 20),
        ),
      ),),
    );
  }
}