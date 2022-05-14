import 'package:flutter/material.dart';

import 'login/login.dart';
import 'register/register.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffB4ECE3),
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                const SizedBox(height: 120),
                Align(
                  alignment: const Alignment(0, -0.5),
                  child: Transform.scale(
                    scale: 0.5,
                    child: Image.asset("assets/icons/cashier.png"),
                  ),
                ),
                const SizedBox(height: 100),
                Align(
                  alignment: const Alignment(0, 0.8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //1) LOGIN
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) {
                                return const LoginPage();
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          primary: const Color(0xff39AEA9),
                        ),
                        child: const Text(
                          "LOG IN",
                          style: TextStyle(fontSize: 30, fontFamily: "Poppins"),
                        ),
                      ),

                      const SizedBox(height: 20),

                      //2) REGISTER
                      ElevatedButton(
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
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          primary: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: const Text(
                          "REGISTER",
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: "Poppins",
                            color: Color(0xff39AEA9),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
