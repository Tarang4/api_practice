class CurrentWeatherModal {
  List<Data>? data;
  num? count;

  CurrentWeatherModal({this.data, this.count});

  CurrentWeatherModal.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Data {
  double? rh;
  String? pod;
  double? lon;
  num? pres;
  String? timezone;
  String? obTime;
  String? countryCode;
  num? clouds;
  num? ts;
  double? solarRad;
  String? stateCode;
  String? cityName;
  double? windSpd;
  String? windCdirFull;
  String? windCdir;
  num? slp;
  num? vis;
  num? hAngle;
  String? sunset;
  double? dni;
  double? dewpt;
  num? snow;
  double? uv;
  num? precip;
  num? windDir;
  String? sunrise;
  double? ghi;
  double? dhi;
  num? aqi;
  double? lat;
  Weather? weather;
  String? datetime;
  double? temp;
  String? station;
  double? elevAngle;
  double? appTemp;

  Data(
      {this.rh,
        this.pod,
        this.lon,
        this.pres,
        this.timezone,
        this.obTime,
        this.countryCode,
        this.clouds,
        this.ts,
        this.solarRad,
        this.stateCode,
        this.cityName,
        this.windSpd,
        this.windCdirFull,
        this.windCdir,
        this.slp,
        this.vis,
        this.hAngle,
        this.sunset,
        this.dni,
        this.dewpt,
        this.snow,
        this.uv,
        this.precip,
        this.windDir,
        this.sunrise,
        this.ghi,
        this.dhi,
        this.aqi,
        this.lat,
        this.weather,
        this.datetime,
        this.temp,
        this.station,
        this.elevAngle,
        this.appTemp});

  Data.fromJson(Map<String, dynamic> json) {
    rh = json['rh'];
    pod = json['pod'];
    lon = json['lon'];
    pres = json['pres'];
    timezone = json['timezone'];
    obTime = json['ob_time'];
    countryCode = json['country_code'];
    clouds = json['clouds'];
    ts = json['ts'];
    solarRad = json['solar_rad'];
    stateCode = json['state_code'];
    cityName = json['city_name'];
    windSpd = json['wind_spd'];
    windCdirFull = json['wind_cdir_full'];
    windCdir = json['wind_cdir'];
    slp = json['slp'];
    vis = json['vis'];
    hAngle = json['h_angle'];
    sunset = json['sunset'];
    dni = json['dni'];
    dewpt = json['dewpt'];
    snow = json['snow'];
    uv = json['uv'];
    precip = json['precip'];
    windDir = json['wind_dir'];
    sunrise = json['sunrise'];
    ghi = json['ghi'];
    dhi = json['dhi'];
    aqi = json['aqi'];
    lat = json['lat'];
    weather =
    json['weather'] != null ? new Weather.fromJson(json['weather']) : null;
    datetime = json['datetime'];
    temp = json['temp'];
    station = json['station'];
    elevAngle = json['elev_angle'];
    appTemp = json['app_temp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rh'] = this.rh;
    data['pod'] = this.pod;
    data['lon'] = this.lon;
    data['pres'] = this.pres;
    data['timezone'] = this.timezone;
    data['ob_time'] = this.obTime;
    data['country_code'] = this.countryCode;
    data['clouds'] = this.clouds;
    data['ts'] = this.ts;
    data['solar_rad'] = this.solarRad;
    data['state_code'] = this.stateCode;
    data['city_name'] = this.cityName;
    data['wind_spd'] = this.windSpd;
    data['wind_cdir_full'] = this.windCdirFull;
    data['wind_cdir'] = this.windCdir;
    data['slp'] = this.slp;
    data['vis'] = this.vis;
    data['h_angle'] = this.hAngle;
    data['sunset'] = this.sunset;
    data['dni'] = this.dni;
    data['dewpt'] = this.dewpt;
    data['snow'] = this.snow;
    data['uv'] = this.uv;
    data['precip'] = this.precip;
    data['wind_dir'] = this.windDir;
    data['sunrise'] = this.sunrise;
    data['ghi'] = this.ghi;
    data['dhi'] = this.dhi;
    data['aqi'] = this.aqi;
    data['lat'] = this.lat;
    if (this.weather != null) {
      data['weather'] = this.weather!.toJson();
    }
    data['datetime'] = this.datetime;
    data['temp'] = this.temp;
    data['station'] = this.station;
    data['elev_angle'] = this.elevAngle;
    data['app_temp'] = this.appTemp;
    return data;
  }
}

class Weather {
  String? icon;
  num? code;
  String? description;

  Weather({this.icon, this.code, this.description});

  Weather.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['code'] = this.code;
    data['description'] = this.description;
    return data;
  }
}