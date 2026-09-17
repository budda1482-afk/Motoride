import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:geolocator/geolocator.dart';

// ==============================================
// 🚨 PASTE YOUR 3 KEYS HERE — REPLACE THESE! 🚨
const SUPABASE_URL = "https://ndruiwwxrnkjsnzoixtd.supabase.co";
const SUPABASE_ANON_KEY = "sb_publishable_H3EStQx7Ek97XoE48pUbCw_RFd9zSuA";
const GOOGLE_MAPS_API_KEY = "AIzaSyAcKf9oVy2n3ywy_BarAbVHT-xcu8U7_f0";
// ==============================================

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: SUPABASE_URL, anonKey: SUPABASE_ANON_KEY);
  runApp(const MotoRideApp());
}

class MotoRideApp extends StatelessWidget {
  const MotoRideApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MotoRide',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? _mapController;
  final List<Marker> _markers = [];
  Position? _currentPosition;
  bool _tracking = false;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      _currentPosition = await Geolocator.getCurrentPosition();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🏍️ MotoRide'), centerTitle: true),
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  flex: 3,
                  child: GoogleMap(
                    onMapCreated: (c) => _mapController = c,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
                      zoom: 16,
                    ),
                    myLocationEnabled: true,
                    markers: Set.of(_markers),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => setState(() => _tracking = !_tracking),
                        icon: Icon(_tracking ? Icons.stop : Icons.play_arrow),
                        label: Text(_tracking ? 'Stop Ride' : 'Start Ride'),
                        style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16), minimumSize: const Size(250, 60)),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(icon: const Icon(Icons.warning_amber, color: Colors.orange, size: 36), onPressed: () {}),
                          IconButton(icon: const Icon(Icons.group, color: Colors.blue, size: 36), onPressed: () {}),
                          IconButton(icon: const Icon(Icons.chat, color: Colors.green, size: 36), onPressed: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
