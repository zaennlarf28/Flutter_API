class QuranModel {
  final String? arti;
  final String? asma;
  final int? ayat;
  final String? nama;
  final String? type;
  final String? urut;
  final String? audio;
  final String? nomor;
  final String? rukuk;
  final String? keterangan;

  QuranModel({
    required this.arti,
    required this.asma,
    required this.ayat,
    required this.nama,
    required this.type,
    required this.urut,
    required this.audio,
    required this.nomor,
    required this.rukuk,
    required this.keterangan,
  });

  factory QuranModel.fromJson(Map<String, dynamic> json) {
    return QuranModel(
      arti: json['arti'],
      asma: json['asma'],
      ayat: json['ayat'],
      nama: json['nama'],
      type: json['type'],
      urut: json['urut'],
      audio: json['audio'],
      nomor: json['nomor'],
      rukuk: json['rukuk'],
      keterangan: json['keterangan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'arti': arti,
      'asma': asma,
      'ayat': ayat,
      'nama': nama,
      'type': type,
      'urut': urut,
      'audio': audio,
      'nomor': nomor,
      'rukuk': rukuk,
      'keterangan': keterangan,
    };
  }
}
