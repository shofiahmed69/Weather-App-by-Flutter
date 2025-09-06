class weather {
  final String cityName;
  final double temperature;
  final String description;
  final int humidity;
  final double windSpeed;
  final int sunset;
  final int sunrise;

  weather({ required this.cityName,
    required this.temperature,
    required this.description,
    required this.humidity,
   required this.windSpeed,
    required this.sunset,
    required this.sunrise,
  } );

  factory weather.fromJson(Map<String, dynamic> json) {
    return weather(cityName: json['name'],
        temperature: json['main']['temp'],
        humidity: json['main']['humidity'],
        description: json['weather'][0]['description'],
        windSpeed: json['wind']['speed'],
        sunset: json['sys']['sunset'],
        sunrise: json['sys']['sunrise'],
    );
  }
}