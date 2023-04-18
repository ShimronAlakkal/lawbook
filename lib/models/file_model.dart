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
    required this.sectionDetails,
    required this.client,
    required this.opposition,
    required this.importance,
    required this.isLive,
    required this.caseDescription,
    required this.hearings,
    required this.files,
  });

  String caseNo;
  String court;
  bool importance;
  Party client;
  Party opposition;
  String section;
  String sectionDetails;
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
        sectionDetails: json["sectionDetails"],
        caseDescription: json["caseDescription"],
        importance: json["importance"],
        isLive: json["isLive"],
        files: List<String>.from(json["files"].map((x) => x)),
        hearings: List<Hearing>.from(
            json["hearings"].map((x) => Hearing.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "caseNo": caseNo,
        "court": court,
        "client": client.toJson(),
        "opposition": opposition.toJson(),
        "section": section,
        "sectionDetails": sectionDetails,
        "caseDescription": caseDescription,
        "isLive": isLive,
        "importance": importance,
        "files": List<dynamic>.from(files.map((x) => x)),
        "hearings": List<dynamic>.from(hearings.map((x) => x.toJson())),
      };
}
