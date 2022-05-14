import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StokPage extends StatelessWidget {
  const StokPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: const Color(0xFF2EA29C),
        centerTitle: true,
        title: Text(
          "Stok Barang",
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
        child: ListView(children: <Widget>[
          DataTable(
              headingRowColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xFFD7D7D7)),
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
                  label: Text('Kategori'),
                ),
                DataColumn(
                  label: Text('Harga Beli (Rp)'),
                ),
                DataColumn(
                  label: Text('Harga Jual (Rp)'),
                ),
                DataColumn(
                  label: Text('Jumlah'),
                ),
                DataColumn(
                  label: Text('Diskon (%)'),
                ),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(Text('1')),
                    DataCell(Text('B0002')),
                    DataCell(Text('Kecap manis 275 ml')),
                    DataCell(Text('Bumbu Dapur')),
                    DataCell(Text('15000')),
                    DataCell(Text('18000')),
                    DataCell(Text('92')),
                    DataCell(Text('0')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('2')),
                    DataCell(Text('B0003')),
                    DataCell(Text('Minyak Goreng Tropical 2L')),
                    DataCell(Text('Minyak Goreng')),
                    DataCell(Text('42000')),
                    DataCell(Text('45000')),
                    DataCell(Text('20')),
                    DataCell(Text('0')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('3')),
                    DataCell(Text('B0004')),
                    DataCell(Text('Lifebuoy Sabun Mandi Cair 450ml')),
                    DataCell(Text('Sabun Mandi')),
                    DataCell(Text('25000')),
                    DataCell(Text('29500')),
                    DataCell(Text('54')),
                    DataCell(Text('0')),
                  ],
                ),
              ],
            ),
        ],),
      ),
    );
  }
}
