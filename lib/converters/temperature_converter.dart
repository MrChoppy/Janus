import 'package:flutter/material.dart';

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key, required this.color});
  final Color color;
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double inputValue = 0;
  String fromUnit = 'Celsius';
  String toUnit = 'Fahrenheit';
  double convertedValue = 0;

  void convertTemperature() {
    setState(() {
      if (fromUnit == toUnit) {
        convertedValue = inputValue;
      } else if (fromUnit == 'Celsius') {
        if (toUnit == 'Fahrenheit') {
          convertedValue = (inputValue * 9 / 5) + 32;
        } else if (toUnit == 'Kelvin') {
          convertedValue = inputValue + 273.15;
        }
      } else if (fromUnit == 'Fahrenheit') {
        if (toUnit == 'Celsius') {
          convertedValue = (inputValue - 32) * 5 / 9;
        } else if (toUnit == 'Kelvin') {
          convertedValue = (inputValue + 459.67) * 5 / 9;
        }
      } else if (fromUnit == 'Kelvin') {
        if (toUnit == 'Celsius') {
          convertedValue = inputValue - 273.15;
        } else if (toUnit == 'Fahrenheit') {
          convertedValue = (inputValue * 9 / 5) - 459.67;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Temperature Converter',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: widget.color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
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
                        convertTemperature();
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: '0',
                      labelText: 'Enter Temperature',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: DropdownButton<String>(
                          value: fromUnit,
                          onChanged: (value) {
                            setState(() {
                              fromUnit = value!;
                              convertTemperature();
                            });
                          },
                          items: ['Celsius', 'Fahrenheit', 'Kelvin']
                              .map((String value) {
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
                              convertTemperature();
                            });
                          },
                          items: ['Celsius', 'Fahrenheit', 'Kelvin']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
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
        ));
  }
}
