import 'package:flutter/material.dart';

class TimeConverter extends StatefulWidget {
  const TimeConverter({super.key, required this.color});
  final Color color;
  @override
  _TimeConverterState createState() => _TimeConverterState();
}

class _TimeConverterState extends State<TimeConverter> {
  double inputValue = 0;
  String fromUnit = 'Hours';
  String toUnit = 'Minutes';
  double convertedValue = 0;

  void convertTime() {
    setState(() {
      if (fromUnit == toUnit) {
        convertedValue = inputValue;
      } else if (fromUnit == 'Hours') {
        if (toUnit == 'Minutes') {
          convertedValue = inputValue * 60;
        } else if (toUnit == 'Seconds') {
          convertedValue = inputValue * 3600;
        }
      } else if (fromUnit == 'Minutes') {
        if (toUnit == 'Hours') {
          convertedValue = inputValue / 60;
        } else if (toUnit == 'Seconds') {
          convertedValue = inputValue * 60;
        }
      } else if (fromUnit == 'Seconds') {
        if (toUnit == 'Hours') {
          convertedValue = inputValue / 3600;
        } else if (toUnit == 'Minutes') {
          convertedValue = inputValue / 60;
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
            'Time Converter',
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
                        convertTime();
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Enter Time',
                      hintText: '0',
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
                              convertTime();
                            });
                          },
                          items: ['Hours', 'Minutes', 'Seconds']
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
                              convertTime();
                            });
                          },
                          items: ['Hours', 'Minutes', 'Seconds']
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
