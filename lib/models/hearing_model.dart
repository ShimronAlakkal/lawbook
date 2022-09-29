class Hearing {
  String hearingDate;
  String hearingDescription;
  Hearing({
    required this.hearingDate,
    required this.hearingDescription,
  });

  factory Hearing.fromJson(Map<String, dynamic> json) => Hearing(
        hearingDate: json["hearingDate"],
        hearingDescription: json["hearingDescription"],
      );

  Map<String, dynamic> toJson() => {
        "hearingDate": hearingDate,
        "hearingDescription": hearingDescription,
      };
}
