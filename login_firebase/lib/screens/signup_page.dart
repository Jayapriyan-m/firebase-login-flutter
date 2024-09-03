import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:login_firebase/controller.dart';
import 'package:login_firebase/screens/login_page.dart';

class SignupPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<LoginController>();
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: AnimatedContainer(
          height: screenSize.height,
          width: screenSize.width,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            // color: Colors.white,
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.purpleAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 20,right: 20,top: screenSize.height * 0.2),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/logo.svg',
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  height: screenSize.height * 0.15,
                ),
                SizedBox(height: screenSize.height * 0.1,),
                Form(
                  key: controller.newFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        controller: controller.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        controller: controller.userNameController,
                        keyboardType: TextInputType.name,
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          labelText: 'UserName',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a Username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10,),
                      ElevatedButton(
                        onPressed: controller.signUp,
                        child: const Text('Sign Up'),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account",style: TextStyle(
                              color: Colors.white
                          )),
                          TextButton(onPressed: (){
                            Get.to(LoginPage());
                          }, child: const Text("Login",style: TextStyle(
                              color: Colors.white
                          ))),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}