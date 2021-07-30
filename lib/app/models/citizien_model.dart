class CitizenResponse {
  CitizenResponse({
    this.statusCode,
    this.statusMessage,
    this.statusDescription,
    this.devErrorDescription,
    this.data,
  });

  int? statusCode;
  String? statusMessage;
  String? statusDescription;
  dynamic devErrorDescription;
  Data? data;

  factory CitizenResponse.fromJson(Map<String, dynamic> json) =>
      CitizenResponse(
        statusCode: json["statusCode"],
        statusMessage: json["statusMessage"],
        statusDescription: json["statusDescription"],
        devErrorDescription: json["devErrorDescription"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "statusMessage": statusMessage,
        "statusDescription": statusDescription,
        "devErrorDescription": devErrorDescription,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.fullName,
    this.arrayFullName,
    this.firstName,
    this.lastName,
  });

  String? fullName;
  List<String>? arrayFullName;
  String? firstName;
  String? lastName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fullName: json["fullName"],
        arrayFullName: List<String>.from(json["arrayFullName"].map((x) => x)),
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "arrayFullName": List<dynamic>.from(arrayFullName!.map((x) => x)),
        "firstName": firstName,
        "lastName": lastName,
      };
}
