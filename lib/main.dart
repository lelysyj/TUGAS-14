import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanMap(),
    );
  }
}

class HalamanMap extends StatefulWidget {
  @override
  State<HalamanMap> createState() => _HalamanMapState();
}

class _HalamanMapState extends State<HalamanMap> {

  final MapController mapController = MapController();

  // Lokasi awal Telkom University
  LatLng lokasi = LatLng(-6.9730, 107.6304);

  // Fungsi pindah lokasi
  void pindahLokasi() {

    // Tahura Djuanda
    lokasi = LatLng(-6.8580, 107.6303);

    setState(() {});

    mapController.move(lokasi, 15);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Maps OSM"),
      ),

      body: FlutterMap(

        mapController: mapController,

        options: MapOptions(
          initialCenter: lokasi,
          initialZoom: 15,
        ),

        children: [

          TileLayer(
            urlTemplate:
              "https://tile.openstreetmap.org/{z}/{x}/{y}.png",

               userAgentPackageName: 'com.example.tugas_14',
          ),  
          MarkerLayer(
            markers: [
              Marker(
                point: lokasi,
                width: 80,
                height: 80,
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: pindahLokasi,
        child: Icon(Icons.location_searching),
      ),
    );
  }
}