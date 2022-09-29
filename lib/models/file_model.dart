import 'dart:convert';
import 'package:lawbook/models/hearing_model.dart';
import 'package:lawbook/models/party_model.dart';

FileModel fileModelFromJson(String str) => FileModel.fromJson(json.decode(str));

String fileModelToJson(FileModel data) => json.encode(data.toJson());

class FileModel {
  FileModel({
    required this.caseNo,
    required this.court,
    required this.party,
    required this.section,
    required this.sectionDetails,
    required this.caseDescription,
    required this.hearings,
    this.tags,
    this.files,
  });

  String caseNo;
  String court;
  Party party;
  String section;
  String sectionDetails;
  String caseDescription;
  List<Hearing> hearings;
  List<String>? tags;
  List<String>? files;

  factory FileModel.fromJson(Map<String, dynamic> json) => FileModel(
        caseNo: json["caseNo"],
        court: json["court"],
        party: Party.fromJson(json["party"]),
        section: json["section"],
        sectionDetails: json["sectionDetails"],
        caseDescription: json["caseDescription"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        files: List<String>.from(json["files"].map((x) => x)),
        hearings: List<Hearing>.from(
            json["hearings"].map((x) => Hearing.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "caseNo": caseNo,
        "court": court,
        "party": party.toJson(),
        "section": section,
        "sectionDetails": sectionDetails,
        "caseDescription": caseDescription,
        "tags": tags != null ? List<dynamic>.from(tags!.map((x) => x)) : [],
        "files": files != null ? List<dynamic>.from(files!.map((x) => x)) : [],
        "hearings": List<dynamic>.from(hearings.map((x) => x.toJson())),
      };
}
