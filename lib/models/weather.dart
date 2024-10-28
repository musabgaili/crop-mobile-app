class Weather {
  bool? ok;
  double? latitude;
  double? longitude;
  Now? now;
  List<Now>? forecast;

  Weather({this.ok, this.latitude, this.longitude, this.now, this.forecast});

  Weather.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    now = json['now'] != null ? Now.fromJson(json['now']) : null;
    if (json['forecast'] != null) {
      forecast = <Now>[];
      json['forecast'].forEach((v) {
        forecast!.add( Now.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ok'] = ok;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    if (now != null) {
      data['now'] = now!.toJson();
    }
    if (forecast != null) {
      data['forecast'] = forecast!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Now {
  String? time;
  double? uvi;

  Now({this.time, this.uvi});

  Now.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    uvi = json['uvi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['uvi'] = uvi;
    return data;
  }
}
