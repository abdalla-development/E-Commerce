import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GoToRegister extends StatelessWidget {
  const GoToRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t Have An Account?  ',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        GestureDetector(
          child: const Text(
            'Register',
            style: TextStyle(
              fontSize: 18.0,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Get.toNamed('/RegisterScreen');
          },
        ),
      ],
    );
  }
}
