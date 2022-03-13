import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:konversisuhu_map/widget/converted.dart';
import 'package:konversisuhu_map/widget/dropdown.dart';
import 'package:konversisuhu_map/widget/history.dart';
import 'package:konversisuhu_map/widget/result.dart';
import 'package:konversisuhu_map/widget/user_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final inputController = TextEditingController();

  double _inputUser = 0;
  String _selectedDropdown = "Kelvin";
  double _result = 0;

  List listHasil = [];
  var listSatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit", "Celcius"];

  onChangedDropdown(newValue) {
    setState(() {
      _selectedDropdown = newValue;
      perhitunganSuhu();
    });
  }

  perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_selectedDropdown == "Kelvin") {
        _result = _inputUser + 273;
        listHasil.add('Kelvin : $_result');
      } else if (_selectedDropdown == "Reamur") {
        _result = (4 / 5) * _inputUser;
        listHasil.add('Reamur : $_result');
      } else if (_selectedDropdown == "Fahrenheit") {
        _result = (9 / 5) * _inputUser + 32;
        listHasil.add('Fahrenheit : $_result');
      } else {
        _result = _inputUser;
        listHasil.add('Celcius : $_result');
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Konversi Suhu',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Konversi Suhu"),
          ),
          body: Container(
            padding: const EdgeInsets.only(top: 30),
            child: Column(children: [
              const Text(
                'Ratu Veronica \n2031710119',
              ),
              User_Input(inputController: inputController),
              const SizedBox(
                height: 10,
              ),
              Dropdown(
                  listItem: listSatuanSuhu,
                  selectedDropdown: _selectedDropdown,
                  onDropdownChange: onChangedDropdown),
              Result(result: _result),
              Converted(konvertHandler: perhitunganSuhu),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
              const Text(
                '\nRiwayat Konversi\n',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Expanded(child: History(listHasil: listHasil))
            ]),
          ),
        ));
  }
}
