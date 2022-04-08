class CompaniesModel {
  CompaniesModel({
    required this.companiesList,
  });

  List<CompaniesList> companiesList;

  factory CompaniesModel.fromJson(Map<String, dynamic> json) => CompaniesModel(
        companiesList: List<CompaniesList>.from(
            json["companiesList"].map((x) => CompaniesList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "companiesList":
            List<dynamic>.from(companiesList.map((x) => x.toJson())),
      };
}

class CompaniesList {
  CompaniesList({
    required this.name,
    required this.company,
    required this.role,
    required this.verified,
    required this.status,
    required this.companyImageUrl,
  });

  String name;
  String company;
  String role;
  bool verified;
  String status;
  String companyImageUrl;

  factory CompaniesList.fromJson(Map<String, dynamic> json) => CompaniesList(
        name: json["name"],
        company: json["company"],
        role: json["role"],
        verified: json["verified"],
        status: json["status"],
        companyImageUrl: json["companyImageURL"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "company": company,
        "role": role,
        "verified": verified,
        "status": status,
        "companyImageURL": companyImageUrl,
      };
}
