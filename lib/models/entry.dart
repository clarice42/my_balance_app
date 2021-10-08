class Entry {
  String name = "name";
  String value = "12.20";
  bool negative = true;

  Entry({required this.name, required this.value, required this.negative});

  Entry.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    value = json["value"];
    negative = json["negative"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["value"] = this.value;
    data["negative"] = this.negative;
    return data;
  }
}
