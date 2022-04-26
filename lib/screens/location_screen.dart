import 'package:weatherfy/screens/city_screen.dart';
import 'package:weatherfy/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:weatherfy/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  double tempreture;
  int condition;
  String cityname;
  int humidity;
  double windSpeed;
  String main;
  int visibility;
  var city;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
    updateCity();
  }

  void updateUI(dynamic weatherData) {
    tempreture = weatherData['main']['temp'];
    condition = weatherData['weather'][0]['id'];
    cityname = weatherData['name'];
    humidity = weatherData['main']['humidity'];
    windSpeed = weatherData['wind']['speed'];
    main = weatherData['weather'][0]['main'];
    visibility = weatherData['visibility'];
  }

  void updateCity() {
    if (city == null) {
      city = cityname;
    } 
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xff000918),
      body: Container(
        height: height - 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xff073C8B),
              offset: Offset(
                0.0,
                5.0,
              ),
              blurRadius: 0.0,
              spreadRadius: 2.0,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              const Color(0xFF3366FF),
              const Color(0xFF00CCFF),
            ],
            begin: const FractionalOffset(0.0, 1.0),
            end: const FractionalOffset(0.0, 0.0),
          ),
        ),
        // constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //  crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationweather();
                      updateUI(weatherData);
                      setState(() {
                        city = cityname;
                      });
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 35.0,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      Text(
                        '$city',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        setState(() {
                          updateUI(weatherData);
                        });

                        city = typedName;
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 35.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      '${weather.getWeatherIcon(condition)}',
                      style: kConditionTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${tempreture.toInt()}',
                            style: kTempTextStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 27, left: 5),
                            child: Text(
                              '°',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.w300,
                                fontSize: 70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '$main',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    Divider(
                      color: Colors.white.withOpacity(0.5),
                      indent: 20,
                      endIndent: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                child: Image(
                                  image: AssetImage('images/wind.png'),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${windSpeed}km/h',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text('Wind'),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                child: Image(
                                  image: AssetImage('images/humidity.png'),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '$humidity%',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text('Humidity'),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                child: Image(
                                  image: AssetImage('images/visibility.png'),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '$visibility',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Visibility'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
