class Hearing {
  DateTime date;
  String description;
  Hearing({
    required this.date,
    required this.description,
  });

  factory Hearing.fromJson(Map<String, dynamic> json) => Hearing(
        date: json["date"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "description": description,
      };
}
