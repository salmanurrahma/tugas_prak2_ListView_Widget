import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:konverter_suhu2/widgets/KonversiSuhu.dart';
import 'package:konverter_suhu2/widgets/PerhitunganTerakhir.dart';
import 'package:konverter_suhu2/widgets/RiwayatPerhitungn.dart';
import 'package:konverter_suhu2/widgets/TargetPerhitungan.dart';
import 'package:konverter_suhu2/widgets/inputSuhu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Konverter Suhu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ['Kelvin', 'Reamur', 'Fahrenheit'];
  String selectedDropdown = 'Kelvin';
  double hasilPerhitungan = 0.0;
  List<String> listHasil = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputSuhu(etInput: etInput),
            const SizedBox(height: 8),
            TargetPerhitungan(
              selectedDropdown: selectedDropdown, 
              listSatuanSuhu: listSatuanSuhu, 
              onDropdownChanged: onDropdownChanged,
              ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Hasil',
              style: TextStyle(fontSize: 20),
            ),
            PerhitunganTerakhir(hasilPerhitungan: hasilPerhitungan),
            const SizedBox(
              height: 10,
            ),
            KonversiSuhu(onPressed: konversiSuhu,),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Riwayat Konversi',
              style: TextStyle(fontSize: 20),
            ),
            RiwayatPerhitungan(listHasil: listHasil),
          ],
        ),
      ),
    );
  }

  void konversiSuhu() {
    setState(() {
      if (etInput.text.isNotEmpty) {
        
        switch (selectedDropdown) {
          case 'Kelvin': 
            hasilPerhitungan = int.parse(etInput.text) + 273.15;
            break;
          case 'Reamur': 
            hasilPerhitungan = int.parse(etInput.text) * 4/5;
            break;
          case 'Fahrenheit': 
            hasilPerhitungan = (int.parse(etInput.text)* 9/5) + 32 ;
            break;
        }
        listHasil.add(selectedDropdown + ' : ' + hasilPerhitungan.toString());
      }
    });
  }

  void onDropdownChanged(Object? value) {
    setState(() {
      selectedDropdown = value.toString();
    });
  }
}
