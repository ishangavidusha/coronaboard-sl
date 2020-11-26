class ApiHistoryData {
  bool success;
  String message;
  List<Data> data;

  ApiHistoryData({this.success, this.message, this.data});

  ApiHistoryData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String date;
  int casesCount;
  int recoveriesCount;
  int deathsCount;

  Data({this.date, this.casesCount, this.recoveriesCount, this.deathsCount});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    casesCount = json['cases_count'];
    recoveriesCount = json['recoveries_count'];
    deathsCount = json['deaths_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['cases_count'] = this.casesCount;
    data['recoveries_count'] = this.recoveriesCount;
    data['deaths_count'] = this.deathsCount;
    return data;
  }
}
