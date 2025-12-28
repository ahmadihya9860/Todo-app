import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade700,

      appBar: AppBar(
        backgroundColor: Colors.orange.shade700,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: Column(
        children: [
          SizedBox(height: 200),
          Center(
            child: Text(
              "Welcome Back",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            "Sign in to your account",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 200, 200, 200),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),

                hintText: "Email",
              ),
            ),
          ),

          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 200, 200, 200),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {},
                ),
                hintText: "Password",
              ),
            ),
          ),

          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "I dont have an acount ",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "SignUp",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Text("Forget password", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
            width: 450,
            height: 50,
            decoration: BoxDecoration(
              color:Colors.orange.shade300,
              borderRadius: BorderRadius.circular(15),
            ),

            child: Center(
              child: Text(
                "Sign In",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
