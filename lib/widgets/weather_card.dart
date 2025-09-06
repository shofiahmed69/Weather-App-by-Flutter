import 'package:flutter/material.dart';
import 'package:ecommerce/model/weather_model.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';
class WeatherCard extends StatelessWidget {
  final weather Weather;
  const WeatherCard({super.key, required this.Weather});
  String formatTime(int timestemp){
    final date = DateTime.fromMillisecondsSinceEpoch(timestemp * 1000);
   return DateFormat('hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          margin : EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
decoration: BoxDecoration(
  color: Colors.white,

),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
Lottie.asset(
  Weather.description.toLowerCase().contains('rain')
      ? 'assets/rain.json'
      : Weather.description.toLowerCase().contains('sun')
      ? 'assets/sunny.json'
      : 'assets/cloudy.json',
  width: 150,
  height: 150,
),
              Text(
                Weather.cityName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 10,),
              Text(
                '${Weather.temperature.toInt()}k',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
             SizedBox(height: 10,),
              Text(
                Weather.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'humidity: ${Weather.humidity}%',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'wind: ${Weather.windSpeed.toInt()}km/h',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.wb_sunny_outlined, color: Colors.orange,),
                      Text(
                        'Sunrise',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        formatTime(Weather.sunrise),
                        style: Theme.of(context).textTheme.bodyLarge,


                      ),
                    ],
                  ),

                 Column(
                   children: [
                     Icon(Icons.nights_stay_outlined, color: Colors.purple,),
                     Text(
                       'Sunset',
                       style: Theme.of(context).textTheme.bodyLarge,
                     ),
                     Text(
                       formatTime(Weather.sunset),
                       style: Theme.of(context).textTheme.bodyLarge,
                     ),
                   ],
                 ),
                ],
              ),

            ],
          ),
        ),
      ],
    );
  }
}
