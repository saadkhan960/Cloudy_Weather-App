class DataModel {
  dynamic queryCost;
  dynamic latitude;
  dynamic longitude;
  dynamic resolvedAddress;
  dynamic address;
  dynamic timezone;
  dynamic tzoffset;
  dynamic description;
  List<Days>? days;
  // List<Null>? alerts;
  Stations? stations;
  CurrentConditions? currentConditions;

  DataModel(
      {queryCost,
      latitude,
      longitude,
      resolvedAddress,
      address,
      timezone,
      tzoffset,
      description,
      days,
      alerts,
      stations,
      currentConditions});

  DataModel.fromJson(Map<String, dynamic> json) {
    queryCost = json['queryCost'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    resolvedAddress = json['resolvedAddress'];
    address = json['address'];
    timezone = json['timezone'];
    tzoffset = json['tzoffset'];
    description = json['description'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(Days.fromJson(v));
      });
    }
    // if (json['alerts'] != null) {
    //   alerts = <Null>[];
    //   json['alerts'].forEach((v) {
    //     alerts!.add(Null.fromJson(v));
    //   });
    // }
    stations =
        json['stations'] != null ? Stations.fromJson(json['stations']) : null;
    currentConditions = json['currentConditions'] != null
        ? CurrentConditions.fromJson(json['currentConditions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['queryCost'] = queryCost;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['resolvedAddress'] = resolvedAddress;
    data['address'] = address;
    data['timezone'] = timezone;
    data['tzoffset'] = tzoffset;
    data['description'] = description;
    if (days != null) {
      data['days'] = days!.map((v) => v.toJson()).toList();
    }
    // if (alerts != null) {
    //   data['alerts'] = alerts!.map((v) => v.toJson()).toList();
    // }
    if (stations != null) {
      data['stations'] = stations!.toJson();
    }
    if (currentConditions != null) {
      data['currentConditions'] = currentConditions!.toJson();
    }
    return data;
  }
}

class Days {
  dynamic datetime;
  dynamic datetimeEpoch;
  dynamic tempmax;
  dynamic tempmin;
  dynamic temp;
  dynamic feelslikemax;
  dynamic feelslikemin;
  dynamic feelslike;
  dynamic dew;
  dynamic humidity;
  dynamic precip;
  dynamic precipprob;
  dynamic precipcover;
  List<dynamic>? preciptype;
  dynamic snow;
  dynamic snowdepth;
  dynamic windgust;
  dynamic windspeed;
  dynamic winddir;
  dynamic pressure;
  dynamic cloudcover;
  dynamic visibility;
  dynamic solarradiation;
  dynamic solarenergy;
  dynamic uvindex;
  dynamic severerisk;
  dynamic sunrise;
  dynamic sunriseEpoch;
  dynamic sunset;
  dynamic sunsetEpoch;
  dynamic moonphase;
  dynamic conditions;
  dynamic description;
  dynamic icon;
  List<dynamic>? stations;
  dynamic source;
  List<Hours>? hours;

  Days(
      {datetime,
      datetimeEpoch,
      tempmax,
      tempmin,
      temp,
      feelslikemax,
      feelslikemin,
      feelslike,
      dew,
      humidity,
      precip,
      precipprob,
      precipcover,
      preciptype,
      snow,
      snowdepth,
      windgust,
      windspeed,
      winddir,
      pressure,
      cloudcover,
      visibility,
      solarradiation,
      solarenergy,
      uvindex,
      severerisk,
      sunrise,
      sunriseEpoch,
      sunset,
      sunsetEpoch,
      moonphase,
      conditions,
      description,
      icon,
      stations,
      source,
      hours});

  Days.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    tempmax = json['tempmax'];
    tempmin = json['tempmin'];
    temp = json['temp'];
    feelslikemax = json['feelslikemax'];
    feelslikemin = json['feelslikemin'];
    feelslike = json['feelslike'];
    dew = json['dew'];
    humidity = json['humidity'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    precipcover = json['precipcover'];
    preciptype = json['preciptype'];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    cloudcover = json['cloudcover'];
    visibility = json['visibility'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    severerisk = json['severerisk'];
    sunrise = json['sunrise'];
    sunriseEpoch = json['sunriseEpoch'];
    sunset = json['sunset'];
    sunsetEpoch = json['sunsetEpoch'];
    moonphase = json['moonphase'];
    conditions = json['conditions'];
    description = json['description'];
    icon = json['icon'];
    stations = json['stations'];
    source = json['source'];
    if (json['hours'] != null) {
      hours = <Hours>[];
      json['hours'].forEach((v) {
        hours!.add(Hours.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['datetime'] = datetime;
    data['datetimeEpoch'] = datetimeEpoch;
    data['tempmax'] = tempmax;
    data['tempmin'] = tempmin;
    data['temp'] = temp;
    data['feelslikemax'] = feelslikemax;
    data['feelslikemin'] = feelslikemin;
    data['feelslike'] = feelslike;
    data['dew'] = dew;
    data['humidity'] = humidity;
    data['precip'] = precip;
    data['precipprob'] = precipprob;
    data['precipcover'] = precipcover;
    data['preciptype'] = preciptype;
    data['snow'] = snow;
    data['snowdepth'] = snowdepth;
    data['windgust'] = windgust;
    data['windspeed'] = windspeed;
    data['winddir'] = winddir;
    data['pressure'] = pressure;
    data['cloudcover'] = cloudcover;
    data['visibility'] = visibility;
    data['solarradiation'] = solarradiation;
    data['solarenergy'] = solarenergy;
    data['uvindex'] = uvindex;
    data['severerisk'] = severerisk;
    data['sunrise'] = sunrise;
    data['sunriseEpoch'] = sunriseEpoch;
    data['sunset'] = sunset;
    data['sunsetEpoch'] = sunsetEpoch;
    data['moonphase'] = moonphase;
    data['conditions'] = conditions;
    data['description'] = description;
    data['icon'] = icon;
    data['stations'] = stations;
    data['source'] = source;
    if (hours != null) {
      data['hours'] = hours!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hours {
  dynamic datetime;
  dynamic datetimeEpoch;
  dynamic temp;
  dynamic feelslike;
  dynamic humidity;
  dynamic dew;
  dynamic precip;
  dynamic precipprob;
  dynamic snow;
  dynamic snowdepth;
  List<dynamic>? preciptype;
  dynamic windgust;
  dynamic windspeed;
  dynamic winddir;
  dynamic pressure;
  dynamic visibility;
  dynamic cloudcover;
  dynamic solarradiation;
  dynamic solarenergy;
  dynamic uvindex;
  dynamic severerisk;
  dynamic conditions;
  dynamic icon;
  List<dynamic>? stations;
  dynamic source;

  Hours(
      {datetime,
      datetimeEpoch,
      temp,
      feelslike,
      humidity,
      dew,
      precip,
      precipprob,
      snow,
      snowdepth,
      preciptype,
      windgust,
      windspeed,
      winddir,
      pressure,
      visibility,
      cloudcover,
      solarradiation,
      solarenergy,
      uvindex,
      severerisk,
      conditions,
      icon,
      stations,
      source});

  Hours.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    temp = json['temp'];
    feelslike = json['feelslike'];
    humidity = json['humidity'];
    dew = json['dew'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    preciptype = json['preciptype'];
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    visibility = json['visibility'];
    cloudcover = json['cloudcover'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    severerisk = json['severerisk'];
    conditions = json['conditions'];
    icon = json['icon'];
    stations = json['stations'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['datetime'] = datetime;
    data['datetimeEpoch'] = datetimeEpoch;
    data['temp'] = temp;
    data['feelslike'] = feelslike;
    data['humidity'] = humidity;
    data['dew'] = dew;
    data['precip'] = precip;
    data['precipprob'] = precipprob;
    data['snow'] = snow;
    data['snowdepth'] = snowdepth;
    data['preciptype'] = preciptype;
    data['windgust'] = windgust;
    data['windspeed'] = windspeed;
    data['winddir'] = winddir;
    data['pressure'] = pressure;
    data['visibility'] = visibility;
    data['cloudcover'] = cloudcover;
    data['solarradiation'] = solarradiation;
    data['solarenergy'] = solarenergy;
    data['uvindex'] = uvindex;
    data['severerisk'] = severerisk;
    data['conditions'] = conditions;
    data['icon'] = icon;
    data['stations'] = stations;
    data['source'] = source;
    return data;
  }
}

class Stations {
  OPKC? oPKC;

  Stations({oPKC});

  Stations.fromJson(Map<String, dynamic> json) {
    oPKC = json['OPKC'] != null ? OPKC.fromJson(json['OPKC']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (oPKC != null) {
      data['OPKC'] = oPKC!.toJson();
    }
    return data;
  }
}

class OPKC {
  dynamic distance;
  dynamic latitude;
  dynamic longitude;
  dynamic useCount;
  dynamic id;
  dynamic name;
  dynamic quality;
  dynamic contribution;

  OPKC(
      {distance,
      latitude,
      longitude,
      useCount,
      id,
      name,
      quality,
      contribution});

  OPKC.fromJson(Map<String, dynamic> json) {
    distance = json['distance'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    useCount = json['useCount'];
    id = json['id'];
    name = json['name'];
    quality = json['quality'];
    contribution = json['contribution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['distance'] = distance;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['useCount'] = useCount;
    data['id'] = id;
    data['name'] = name;
    data['quality'] = quality;
    data['contribution'] = contribution;
    return data;
  }
}

class CurrentConditions {
  dynamic datetime;
  dynamic datetimeEpoch;
  dynamic temp;
  dynamic feelslike;
  dynamic humidity;
  dynamic dew;
  // Null precip;
  dynamic precipprob;
  dynamic snow;
  dynamic snowdepth;
  // Null preciptype;
  // Null windgust;
  dynamic windspeed;
  dynamic winddir;
  dynamic pressure;
  dynamic visibility;
  dynamic cloudcover;
  dynamic solarradiation;
  dynamic solarenergy;
  dynamic uvindex;
  dynamic conditions;
  dynamic icon;
  List<dynamic>? stations;
  dynamic source;
  dynamic sunrise;
  dynamic sunriseEpoch;
  dynamic sunset;
  dynamic sunsetEpoch;
  dynamic moonphase;

  CurrentConditions(
      {datetime,
      datetimeEpoch,
      temp,
      feelslike,
      humidity,
      dew,
      precip,
      precipprob,
      snow,
      snowdepth,
      preciptype,
      windgust,
      windspeed,
      winddir,
      pressure,
      visibility,
      cloudcover,
      solarradiation,
      solarenergy,
      uvindex,
      conditions,
      icon,
      stations,
      source,
      sunrise,
      sunriseEpoch,
      sunset,
      sunsetEpoch,
      moonphase});

  CurrentConditions.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    temp = json['temp'];
    feelslike = json['feelslike'];
    humidity = json['humidity'];
    dew = json['dew'];
    // precip = json['precip'];
    precipprob = json['precipprob'];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    // preciptype = json['preciptype'];
    // windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    visibility = json['visibility'];
    cloudcover = json['cloudcover'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    conditions = json['conditions'];
    icon = json['icon'];
    stations = json['stations'];
    source = json['source'];
    sunrise = json['sunrise'];
    sunriseEpoch = json['sunriseEpoch'];
    sunset = json['sunset'];
    sunsetEpoch = json['sunsetEpoch'];
    moonphase = json['moonphase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['datetime'] = datetime;
    data['datetimeEpoch'] = datetimeEpoch;
    data['temp'] = temp;
    data['feelslike'] = feelslike;
    data['humidity'] = humidity;
    data['dew'] = dew;
    // data['precip'] = precip;
    data['precipprob'] = precipprob;
    data['snow'] = snow;
    data['snowdepth'] = snowdepth;
    // data['preciptype'] = preciptype;
    // data['windgust'] = windgust;
    data['windspeed'] = windspeed;
    data['winddir'] = winddir;
    data['pressure'] = pressure;
    data['visibility'] = visibility;
    data['cloudcover'] = cloudcover;
    data['solarradiation'] = solarradiation;
    data['solarenergy'] = solarenergy;
    data['uvindex'] = uvindex;
    data['conditions'] = conditions;
    data['icon'] = icon;
    data['stations'] = stations;
    data['source'] = source;
    data['sunrise'] = sunrise;
    data['sunriseEpoch'] = sunriseEpoch;
    data['sunset'] = sunset;
    data['sunsetEpoch'] = sunsetEpoch;
    data['moonphase'] = moonphase;
    return data;
  }
}
