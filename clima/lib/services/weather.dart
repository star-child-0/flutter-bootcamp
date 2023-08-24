class Weather {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return "🌩";
    } else if (condition < 400) {
      return "🌧";
    } else if (condition < 600) {
      return "☔️";
    } else if (condition < 700) {
      return "☃️";
    } else if (condition < 800) {
      return "🌫";
    } else if (condition == 800) {
      return "☀️";
    } else if (condition <= 804) {
      return "☁️";
    } else {
      return "🤷‍";
    }
  }

  String getTemperatureIcon(double temp) {
    if (temp > 30.0) {
      return "🔥";
    } else if (temp > 20.0) {
      return "🌡️";
    } else {
      return "❄️";
    }
  }
}
