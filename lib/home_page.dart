import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SensorData aevent = SensorData(0, 0, 0);
  SensorData uevent = SensorData(0, 0, 0);
  SensorData gevent = SensorData(0, 0, 0);
  SensorData mevent = SensorData(0, 0, 0);

  @override
  void initState() {
    accelerometerEvents.listen(
      (AccelerometerEvent event) {
        aevent = SensorData(event.x, event.y, event.z);
        aevent.error = null;
        setState(() {});
      },
      onError: (error) {
        // Logic to handle error
        // Needed for Android in case sensor is not available
        aevent = error;
      },
      cancelOnError: true,
    );
// [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]

    userAccelerometerEvents.listen(
      (UserAccelerometerEvent event) {
        uevent = SensorData(event.x, event.y, event.z);
        uevent.error = null;
        setState(() {});
      },
      onError: (error) => uevent = error,
      cancelOnError: true,
    );
// [UserAccelerometerEvent (x: 0.0, y: 0.0, z: 0.0)]

    gyroscopeEvents.listen(
      (GyroscopeEvent event) {
        gevent = SensorData(event.x, event.y, event.z);
        gevent.error = null;
        setState(() {});
      },
      onError: (error) => gevent = error,
      cancelOnError: true,
    );
// [GyroscopeEvent (x: 0.0, y: 0.0, z: 0.0)]

    magnetometerEvents.listen(
      (MagnetometerEvent event) {
        mevent = SensorData(event.x, event.y, event.z);
        mevent.error = null;
        setState(() {});
      },
      onError: (error) => mevent = error,
      cancelOnError: true,
    );
// [MagnetometerEvent (x: -23.6, y: 6.2, z: -34.9)]
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium;
    final width = (MediaQuery.of(context).size.width / 5);
    return Scaffold(
        body: Center(
      child: SizedBox(
        width: width * 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Sensors', style: style),
            const Divider(height: 4),
            Row(
              children: [
                SizedBox(
                  width: width,
                  child: Column(
                    children: [
                      Text('A', style: style),
                      Text('U', style: style),
                      Text('G', style: style),
                      Text('M', style: style),
                      Text('', style: style),
                    ],
                  ),
                ),
                SizedBox(
                  width: width,
                  child: Column(
                    children: [
                      Text(aevent.x.toStringAsFixed(1), style: style),
                      Text(uevent.x.toStringAsFixed(1), style: style),
                      Text(gevent.x.toStringAsFixed(1), style: style),
                      Text(mevent.x.toStringAsFixed(1), style: style),
                      Text('x', style: style),
                    ],
                  ),
                ),
                SizedBox(
                  width: width,
                  child: Column(
                    children: [
                      Text(aevent.y.toStringAsFixed(1), style: style),
                      Text(uevent.y.toStringAsFixed(1), style: style),
                      Text(gevent.y.toStringAsFixed(1), style: style),
                      Text(mevent.y.toStringAsFixed(1), style: style),
                      Text('y', style: style),
                    ],
                  ),
                ),
                SizedBox(
                  width: width,
                  child: Column(
                    children: [
                      Text(aevent.z.toStringAsFixed(1), style: style),
                      Text(uevent.z.toStringAsFixed(1), style: style),
                      Text(gevent.z.toStringAsFixed(1), style: style),
                      Text(mevent.z.toStringAsFixed(1), style: style),
                      Text('z', style: style),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class SensorData {
  SensorData(this.x, this.y, this.z, {this.error});

  final double x, y, z;
  String? error;

  @override
  String toString() => error != null
      ? 'Error'
      : '${x.toStringAsFixed(1)} : ${y.toStringAsFixed(1)} : ${z.toStringAsFixed(1)}';
}
