import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase/screens/home_page.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final newFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  void login() {
    if (formKey.currentState!.validate()) {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text)
          .then((value) {
        Get.to(HomePage());
        clearFields(false);
      })
          .onError((error, stackTrace) {
            Get.snackbar("Error", error.toString());
      });
    }
  }

  void signUp() {
    if (newFormKey.currentState!.validate()) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text)
          .then((value)  {
        Get.to(HomePage());
        clearFields(true);
      })
          .onError((error, stackTrace) {
        Get.snackbar("Error", error.toString());
      });
    }
  }

  void clearFields(bool isSignup){
    emailController.clear();
    passwordController.clear();
    if(isSignup){
      userNameController.clear();
    }
  }

}