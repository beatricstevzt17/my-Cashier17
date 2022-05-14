import 'package:app_kasir/app/controllers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../register/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = false;

  //1) bikin controller utk textform
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //PROVIDERS
    final users = Provider.of<UserProvier>(context);

    return Scaffold(
      backgroundColor: const Color(0xffB4ECE3),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //1) TEXT PEMBUKA (WELCOMING)
              Text(
                "Login",
                style: GoogleFonts.berkshireSwash(
                    fontSize: 45, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Welcome back to Axcora Cashier Apps',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 60),

              //2) utk TEXT FIELD EMAIL
              Container(
                margin: const EdgeInsets.fromLTRB(400, 15, 400, 15),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.07),
                      blurRadius: 50,
                      spreadRadius: 0,
                      offset: Offset(12, 26),
                    )
                  ],
                ),
                child: TextField(
                  controller: _emailC,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'example@gmail.com',
                    labelText: 'Email',
                    prefixIcon: const Icon(
                      Icons.mail,
                      color: Color(0xff39AEA9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              //3) utk TEXT FIELD PASSWORD
              Container(
                margin: const EdgeInsets.fromLTRB(400, 15, 400, 15),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.07),
                      blurRadius: 50,
                      spreadRadius: 0,
                      offset: Offset(12, 26),
                    )
                  ],
                ),
                child: TextField(
                  controller: _passC,
                  obscureText: isVisible ? false : true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'your password',
                    labelText: 'Password',
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xff39AEA9),
                    ),
                    suffixIcon: IconButton(
                      icon: isVisible
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.visibility_off),
                      onPressed: () => setState(() {
                        isVisible = !isVisible;
                      }),
                      color: const Color(0xff39AEA9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              //4) BUTTON LOGIN
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff39AEA9),
                ),
                child: TextButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    users.login(
                        context: context,
                        email: _emailC.text,
                        password: _passC.text);
                  },
                ),
              ),

              //5) BALIK KE REGISTER PAGE
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return const RegisterPage();
                      },
                    ),
                  );
                },
                child: const Text(
                  'create account',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
