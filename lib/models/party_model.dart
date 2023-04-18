class Party {
  Party({
    required this.name,
    required this.stand,
    required this.phone,
    required this.advocateRep,
  });

  String name;
  String stand;
  String phone;
  String advocateRep;

  factory Party.fromJson(Map<String, dynamic> json) => Party(
        name: json["name"],
        stand: json["stand"],
        phone: json["phone"],
        advocateRep: json["advocateRep"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "stand": stand,
        "phone": phone,
        "advocateRep": advocateRep,
      };
}
