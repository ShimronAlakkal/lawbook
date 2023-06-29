import 'dart:convert';
import 'package:lawbook/models/hearing_model.dart';
import 'package:lawbook/models/party_model.dart';

FileModel fileModelFromJson(String str) => FileModel.fromJson(json.decode(str));

String fileModelToJson(FileModel data) => json.encode(data.toJson());

class FileModel {
  FileModel({
    required this.court,
    required this.caseNo,
    required this.section,
    required this.caseDescription,
    required this.client,
    required this.opposition,
    required this.importance,
    required this.isLegalAid,
    required this.isLive,
    required this.hearings,
    required this.files,
  });

  String caseNo;
  String court;
  bool importance;
  bool isLegalAid;
  String section;
  Party client;
  Party opposition;

  String caseDescription;
  bool isLive;
  List<Hearing> hearings;

  List<String> files;

  factory FileModel.fromJson(Map<String, dynamic> json) => FileModel(
        caseNo: json["caseNo"],
        court: json["court"],
        client: Party.fromJson(json["party"]),
        opposition: Party.fromJson(json["party"]),
        section: json["section"],
        caseDescription: json["caseDescription"],
        importance: json["importance"],
        isLegalAid: json["isLegalAid"],
        isLive: json["isLive"],
        hearings: List<Hearing>.from(
            json["hearings"].map((x) => Hearing.fromJson(x))),
        files: json['files'],
      );

  Map<String, dynamic> toJson() => {
        "caseNo": caseNo,
        "court": court,
        "client": client.toJson(),
        "isLegalAid": isLegalAid,
        "opposition": opposition.toJson(),
        "section": section,
        "caseDescription": caseDescription,
        "isLive": isLive,
        "importance": importance,
        "hearings": List<dynamic>.from(hearings.map((x) => x.toJson())),
        "files": files
      };
}
