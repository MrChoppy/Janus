import 'package:flutter/material.dart';
import 'dart:math';

class AnglesConverter extends StatefulWidget {
  const AnglesConverter({super.key, required this.color});
  final Color color;
  @override
  _AnglesConverterState createState() => _AnglesConverterState();
}

class _AnglesConverterState extends State<AnglesConverter> {
  double inputValue = 0;
  String fromUnit = 'Degrees';
  String toUnit = 'Radians';
  double convertedValue = 0;

  final Map<String, double> units = {
    'Degrees': 1.0,
    'Radians': pi / 180,
    'Gradians': 0.9,
  };

  void convertAngles() {
    setState(() {
      if (fromUnit == toUnit) {
        convertedValue = inputValue;
      } else {
        double baseValue = inputValue * units[fromUnit]!;
        convertedValue = baseValue / units[toUnit]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Angles Converter',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: widget.color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      inputValue = double.tryParse(value) ?? 0.0;
                      convertAngles();
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter Angle',
                    hintText: '0',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: DropdownButton<String>(
                        value: fromUnit,
                        onChanged: (value) {
                          setState(() {
                            fromUnit = value!;
                            convertAngles();
                          });
                        },
                        items: units.keys
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    const Icon(Icons.arrow_forward, size: 36),
                    Expanded(
                      child: DropdownButton<String>(
                        value: toUnit,
                        onChanged: (value) {
                          setState(() {
                            toUnit = value!;
                            convertAngles();
                          });
                        },
                        items: units.keys
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Converted Value: $convertedValue $toUnit',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
