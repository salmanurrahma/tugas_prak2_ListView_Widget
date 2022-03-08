// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = TextEditingController();

  double inputUser = 0;
  double kelvin = 0;
  double reamur = 0;

konversi (){
  //set state
  setState(() {
    inputUser = double.parse(etInput.text);
    reamur = 4 / 5 * inputUser;
    kelvin = inputUser + 273;
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Suhu Converter"),
          ),
          body: Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: "Masukkan Nilai Suhu celcius"),
                    keyboardType: TextInputType
                        .number, //supaya jenis text nya angka bukan huruf
                    //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: etInput,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Suhu Dalam Kelvin",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '$kelvin',
                            style: const TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Suhu Dalam Reamur",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '$reamur',
                            style: const TextStyle(fontSize: 30),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        onPressed: konversi,
                        color: Colors.blue,
                        textColor: Colors.black,
                        child: const Text("Konversi"),
                      ))
                ],
              )),
        ));
  }
}