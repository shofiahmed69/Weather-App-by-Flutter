import 'package:ecommerce/model/weather_model.dart';
import 'package:ecommerce/weather%20service/weather_service.dart';
import 'package:ecommerce/widgets/weather_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final weatherService _weatherService = weatherService();
  final TextEditingController _cityController = TextEditingController();
  bool _isLoading = false;
  weather? _weather;
  void _getWeather() async {
    setState(() {
      _isLoading = true;
    });
  try {
    final weather = await _weatherService.featchweather(_cityController.text);
    setState(() {
      _weather = weather;
      _isLoading = false;
    });
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
     const SnackBar(
        content: Text('error fetching weather data'),
      ),
    );

  }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: _weather != null && _weather!.description.toLowerCase().contains('rain')
              ? const LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
              : _weather != null && _weather!.description.toLowerCase().contains('sun')
              ? const LinearGradient(
            colors: [Colors.yellow, Colors.orange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
              : const LinearGradient(
            colors: [Colors.blue, Colors.blueGrey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:  Column(
           children: [
            const SizedBox( height: 25,),
             const Text(
               'Weather App',
               style: TextStyle(
                 fontSize: 32,
                 fontWeight: FontWeight.bold,
                 color: Colors.white,
             ),
             ),
            const SizedBox(height: 25,),
             TextField(
               controller: _cityController,
               style: const TextStyle(color: Colors.white),
               decoration: InputDecoration(
                 hintText: "enter your city name",
                 hintStyle: const TextStyle(color: Colors.white),
                 filled: true,
                 fillColor:  Colors.white10,
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(12),
                   borderSide: BorderSide.none,

                 )
               ),
             ),
             const SizedBox(height: 20,),
             ElevatedButton(onPressed: _getWeather,
                 child: Text('get weather', style: TextStyle(fontSize: 18),),
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.blueGrey,
                 foregroundColor: Colors.grey,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(12),
                 ),

               ),
             ),
             if (_isLoading)
               Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator(color: Colors.white),),
             if (_weather != null)
               WeatherCard(Weather: _weather!),

            ],
          ),
        ),
      ),
    ),
    );
  }
}
