import 'source.dart';



class SourceResponse {
  SourceResponse({
      this.status, 
      this.sources,this.code,this.message});

  SourceResponse.fromJson(dynamic json) {
    code= json['code'];
    message=json['message'];
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }
  String? message;
  String? code;
  String? status;
  List<Source>? sources;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}