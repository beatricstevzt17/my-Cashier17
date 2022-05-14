import 'package:app_kasir/app/services/users_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controllers/users_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //1) bikin controller utk textform
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  void initState() {
    //PROVIDERS
    final users = Provider.of<UserProvier>(context, listen: false);
    _username.text = users.getData!.username;
    _email.text = users.getData!.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //PROVIDERS
    final users = Provider.of<UserProvier>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB), //background dasar,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: const Color(0xFF2EA29C),
        centerTitle: true,
        title: Text(
          "Manage Profile",
          style: GoogleFonts.kaushanScript(fontSize: 35),
        ),
      ),
      body: FutureBuilder(
          future:
          //MENDAPATKAN DATA SEBELUMNYA
              UserService().getUser(context: context, id: users.getData!.id),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.27,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //1) foto profile
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.amber,
                        image: DecorationImage(
                            image: AssetImage("assets/icons/cashier.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    //2) username
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Username",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF5E5E5E),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          TextFormField(
                            controller: _username,
                            decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                fillColor: Colors.white,
                                filled: true),
                          )
                        ],
                      ),
                    ),

                    //3) email
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Email",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF5E5E5E),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          TextFormField(
                            controller: _email,
                            decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                fillColor: Colors.white,
                                filled: true),
                          )
                        ],
                      ),
                    ),

                    //4) button
                    ElevatedButton(
                        onPressed: () async {
                          UserService().update(
                              id: users.getData!.id,
                              username: _username.text,
                              email: _email.text,
                              context: context,
                              token: users.getToken);
                        },
                        child: const Text("Simpan"))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
