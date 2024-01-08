import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherContainer extends StatefulWidget {
  @override
  _WeatherContainerState createState() => _WeatherContainerState();
}

class _WeatherContainerState extends State<WeatherContainer> {
  final String apiKey = 'a4fdf7ed4c4660edb4064c99bb80410f';

  String cityName = '';
  String weatherDescription = '';
  double temperature = 0.0;

  // Controller for the search field
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch weather data when the widget is initialized
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final String city = searchController.text.trim();
    final String apiURL = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(apiURL));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          cityName = data['name'];
          weatherDescription = data['weather'][0]['description'];
          temperature = data['main']['temp'];
        });
      } else {
        print('Failed to fetch weather data: ${response.statusCode}, ${response.body}');
      }
    } catch (error) {
      print('Error fetching weather data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 210,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 15,
            right: 10,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(
                  icon: Icon(Icons.cloudy_snowing, size: 40, color: Colors.white),
                  onPressed: () {
                    // Add logic here
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Weather Text
                Text(
                  'Weather',
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Container(
                  width: 150,
                  height: 40,
                  color: Colors.white,
                  child: TextField(
                    onSubmitted: (value) {
                      // Triggered when the user presses enter in the TextField
                      fetchWeatherData();
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search..',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: TextButton(
                        onPressed: () {
                          // Add your search functionality here
                          fetchWeatherData();
                          print('Search button pressed');
                        },
                        child: Icon(Icons.search, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Display Temperature
                Text(
                  temperature == 0.0 ? '' : '${temperature.toStringAsFixed(1)} °C',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
