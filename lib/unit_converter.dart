import 'package:flutter/material.dart';
import 'package:janus/converters/angles_converter.dart';
import 'package:janus/converters/mass_converter.dart';
import 'package:janus/converters/area_converter.dart';

import 'converters/length_converter.dart';
import 'converters/temperature_converter.dart';
import 'converters/time_converter.dart';
import 'converters/volume_converter.dart';
import 'widgets/converter_card.dart';

class UnitConverterScreen extends StatefulWidget {
  const UnitConverterScreen({super.key});

  @override
  _UnitConverterScreenState createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Janus Unit Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 2,
          children: <Widget>[
            ConverterCard(
              title: 'Temperature',
              icon: Icons.thermostat,
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const TemperatureConverter(color: Colors.blue)),
                );
              },
            ),
            ConverterCard(
              title: 'Time',
              icon: Icons.access_time,
              color: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const TimeConverter(color: Colors.green)),
                );
              },
            ),
            ConverterCard(
              title: 'Length',
              icon: Icons.straighten,
              color: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LengthConverter(color: Colors.orange)),
                );
              },
            ),
            ConverterCard(
              title: 'Area',
              icon: Icons.border_outer,
              color: Colors.purple,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AreaConverter(color: Colors.purple)),
                );
              },
            ),
            ConverterCard(
              title: 'Volume',
              icon: Icons.line_weight,
              color: Colors.red,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const VolumeConverter(color: Colors.red)),
                );
              },
            ),
            ConverterCard(
              title: 'Mass',
              icon: Icons.fitness_center,
              color: Colors.teal,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MassConverter(color: Colors.teal)),
                );
              },
            ),
            ConverterCard(
              title: 'Angles',
              icon: Icons.rotate_right,
              color: Colors.deepOrange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AnglesConverter(color: Colors.deepOrange)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
