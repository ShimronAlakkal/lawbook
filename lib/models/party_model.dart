class Party {
  Party({
    required this.name,
    required this.side,
    required this.phone,
    this.address,
    required this.advocateRep,
  });

  String name;
  String side;
  String phone;
  String? address;
  String advocateRep;

  factory Party.fromJson(Map<String, dynamic> json) => Party(
        name: json["name"],
        side: json["side"],
        phone: json["phone"],
        address: json["address"],
        advocateRep: json["advocateRep"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "side": side,
        "phone": phone,
        "address": address ?? '',
        "advocateRep": advocateRep,
      };
}
