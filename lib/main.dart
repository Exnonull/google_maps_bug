import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Set<Polyline> polylines = {
      Polyline(
        color: Colors.black,
        polylineId: PolylineId(
          'global',
        ),
        patterns: [
          PatternItem.dot,
          PatternItem.gap(10), // without gap it's doesn't crash...
        ],
        points: [
          LatLng(50.450952, 30.522617),
          LatLng(37.33492222, -122.03304215),
        ],
      )
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GoogleMap(
        polylines: polylines,
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0),
          zoom: 0.0,
        ),
      ),
    );
  }
}
