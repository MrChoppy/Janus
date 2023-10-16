import 'package:flutter/material.dart';

class MassConverter extends StatefulWidget {
  const MassConverter({super.key, required this.color});
  final Color color;
  @override
  _MassConverterState createState() => _MassConverterState();
}

class _MassConverterState extends State<MassConverter> {
  double inputValue = 0;
  String fromUnit = 'Kilograms';
  String toUnit = 'Grams';
  double convertedValue = 0;

  final Map<String, double> units = {
    'Kilograms': 1.0,
    'Grams': 1000.0,
    'Pounds (US)': 2.20462,
    'Ounces': 35.27396,
  };

  void convertMass() {
    setState(() {
      if (fromUnit == toUnit) {
        convertedValue = inputValue;
      } else {
        double baseValue = inputValue / units[fromUnit]!;
        convertedValue = baseValue * units[toUnit]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mass Converter'),
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
                const Text(
                  'Mass Converter',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      inputValue = double.tryParse(value) ?? 0.0;
                      convertMass();
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter Mass',
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
                            convertMass();
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
                            convertMass();
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
