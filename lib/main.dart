import 'package:app_kasir/app/controllers/users_provider.dart';
import 'package:app_kasir/app/screens/halaman_utama.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => UserProvier(),
      ),
    ], child: const MaterialApp(home: HalamanUtama()));
  }
}
