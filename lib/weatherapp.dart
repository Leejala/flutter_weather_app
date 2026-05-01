import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const weatherapp());
}

class weatherapp extends StatelessWidget {
  const weatherapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String city = "Pokhara";
  String temp = "28°C";
  String condition = "Sunny";
  IconData icon = Icons.wb_sunny;

  final List<Map<String, dynamic>> weatherData = [
    {"temp": "28°C", "condition": "Sunny", "icon": Icons.wb_sunny},
    {"temp": "22°C", "condition": "Cloudy", "icon": Icons.cloud},
    {"temp": "18°C", "condition": "Rainy", "icon": Icons.grain},
  ];

  void changeWeather() {
    final random = Random().nextInt(weatherData.length);
    setState(() {
      temp = weatherData[random]["temp"];
      condition = weatherData[random]["condition"];
      icon = weatherData[random]["icon"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7EA9E1), Color(0xFFB9D4F5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Weather",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Icon(Icons.menu, color: Colors.white),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // City
              Text(
                city,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 22,
                ),
              ),

              const SizedBox(height: 10),

              // Temperature
              Text(
                temp,
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),

              // Icon
              Icon(
                icon,
                size: 80,
                color: Colors.white,
              ),

              Text(
                condition,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 30),

              // Search + Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter city...",
                    hintStyle: const TextStyle(color: Colors.white60),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    city = value;
                  },
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  setState(() {});
                  changeWeather();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Check Weather"),
              ),

              const SizedBox(height: 30),

              // Bottom Info Cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    infoBox("Wind", "17 km/h"),
                    infoBox("Humidity", "58%"),
                    infoBox("Rain", "15%"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoBox(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(color: Colors.white)),
          Text(title, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}