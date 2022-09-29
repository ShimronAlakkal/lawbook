class Party {
  Party({
    required this.name,
    required this.stand,
    required this.description,
    required this.phone,
    required this.advocateRep,
  });

  String name;
  String stand;
  String description;
  String phone;
  String advocateRep;

  factory Party.fromJson(Map<String, dynamic> json) => Party(
        name: json["name"],
        stand: json["stand"],
        description: json["description"],
        phone: json["phone"],
        advocateRep: json["advocateRep"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "stand": stand,
        "description": description,
        "phone": phone,
        "advocateRep": advocateRep,
      };
}
