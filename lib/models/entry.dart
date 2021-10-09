class Entry {
  String name = "name";
  String value = "12.20";
  bool negative = true;
  String date = "02/02/2002";

  Entry({
    required this.name,
    required this.value,
    required this.negative,
    required this.date,
  });

  Entry.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    value = json["value"];
    negative = json["negative"];
    date = json["date"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["value"] = this.value;
    data["negative"] = this.negative;
    data["date"] = this.date;
    return data;
  }
}
