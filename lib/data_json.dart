import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

class Data {
  Data({
    required this.update,
  });

  Update update;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        update: Update.fromJson(json["update"]),
      );

  Map<String, dynamic> toJson() => {
        "update": update.toJson(),
      };
}

class Update {
  Update({
    required this.penambahan,
  });

  Penambahan penambahan;

  factory Update.fromJson(Map<String, dynamic> json) => Update(
        penambahan: Penambahan.fromJson(json["penambahan"]),
      );

  Map<String, dynamic> toJson() => {
        "penambahan": penambahan.toJson(),
      };
}

class Penambahan {
  Penambahan({
    required this.jumlahPositif,
    required this.jumlahMeninggal,
    required this.tanggal,
  });

  int jumlahPositif;
  int jumlahMeninggal;
  String tanggal;

  factory Penambahan.fromJson(Map<String, dynamic> json) => Penambahan(
        jumlahPositif: json["jumlah_positif"],
        jumlahMeninggal: json["jumlah_meninggal"],
        tanggal: json["tanggal"],
      );

  Map<String, dynamic> toJson() => {
        "jumlah_positif": jumlahPositif,
        "jumlah_meninggal": jumlahMeninggal,
        "tanggal": tanggal
      };
}
