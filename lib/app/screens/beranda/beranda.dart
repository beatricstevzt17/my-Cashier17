import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_kasir/app/screens/stok/stok.dart';
import 'package:app_kasir/app/screens/profile/profile.dart';
import 'textform.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB), //background dasar
      appBar: AppBar(
        backgroundColor: const Color(0xFF2EA29C),
        centerTitle: true,
        title: Text(
          "Axcora Cashier",
          style: GoogleFonts.kaushanScript(fontSize: 35),
        ),
      ),
      //ALAS UTAMA
      body: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),

        //ISI CONTAINER ALAS UTAMA
        child: ListView(
          children: <Widget>[
            //1) KONTEN 1 : ROW berisi textfield data barang & total transaksi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //1a) Anak 1 : DATA BARANG
                Container(
                  margin: const EdgeInsets.all(10),
                  // color: Colors.purple,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    children: <Widget>[
                      //id barang
                      CustomWidgets.textField('Id Barang : ',
                          isNumber: true, hintText: "B0025"),
                      const SizedBox(
                        height: 2,
                      ),
                      //nama barang
                      CustomWidgets.textField('Nama Barang : ',
                          hintText: "Minyak Goreng"),
                      const SizedBox(
                        height: 2,
                      ),
                      //harga
                      CustomWidgets.textField('Harga (Rp) : ',
                          isNumber: true, hintText: "45000"),
                      const SizedBox(
                        height: 2,
                      ),
                      //jumlah
                      CustomWidgets.textField('Jumlah : ',
                          isNumber: true, hintText: "1"),
                      const SizedBox(
                        height: 2,
                      ),
                      //sub-total
                      CustomWidgets.textField('Sub Total (Rp) : ',
                          isNumber: true, hintText: "45000"),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Tambah"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),

                //1b) Anak 2 : TOTAL TRANSAKSI
                Container(
                  // color: Colors.pink,
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    children: <Widget>[
                      //Total
                      CustomWidgets.textField('Total (Rp) : ',
                          isNumber: true, hintText: "61000"),
                      const SizedBox(
                        height: 2,
                      ),
                      //Bayar
                      CustomWidgets.textField('Bayar (Rp)  : ',
                          isNumber: true, hintText: "100000"),
                      const SizedBox(
                        height: 2,
                      ),
                      //Kembalian
                      CustomWidgets.textField('Kembali (Rp)  : ',
                          isNumber: true, hintText: "39000"),
                      const SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
///////////////////////////////////////////////////////////////////////////////////////
            //2) KONTEN2 : TABEL TRANSAKSI
            DataTable(
              headingRowColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xFF2EA29C)),
              columns: const [
                DataColumn(
                  label: Text('NO'),
                ),
                DataColumn(
                  label: Text('ID'),
                ),
                DataColumn(
                  label: Text('Nama Barang'),
                ),
                DataColumn(
                  label: Text('Harga'),
                ),
                DataColumn(
                  label: Text('Jumlah'),
                ),
                DataColumn(
                  label: Text('Sub-Total'),
                ),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(Text('1')),
                    DataCell(Text('B0002')),
                    DataCell(Text('Kecap manis')),
                    DataCell(Text('8000')),
                    DataCell(Text('2')),
                    DataCell(Text('16000')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('2')),
                    DataCell(Text('B0025')),
                    DataCell(Text('Minyak Goreng')),
                    DataCell(Text('45000')),
                    DataCell(Text('1')),
                    DataCell(Text('45000')),
                  ],
                ),
              ],
            ),
///////////////////////////////////////////////////////////////////////////////////////
            //3) BUTTON : SELESAI
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Selesai >>"),
              ),
            )
          ],
        ),
      ),

//********************************** DRAWER **********************************
      drawer: Drawer(
          backgroundColor: const Color(0xFFEBEBEB),
          child: Column(
            children: <Widget>[
              //1.) BERANDA
              ListTile(
                title: const Text(
                  "Tambah Penjualan",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const BerandaPage(),
                  ),
                ),
              ),
              //2.) LIHAT PENJUALAN
              ListTile(
                title: const Text(
                  "Stok Barang",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const StokPage(),
                  ),
                ),
              ),
              //3.) Manage Profile
              ListTile(
                  title: const Text(
                    "Ubah Akun",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ProfilePage(),
                      ),
                    );
                  }),
            ],
          )),
    );
  }
}
