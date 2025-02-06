class Surah {
  final int number;
  final String nama;
  final String namalatin;
  final String revelationType;
  final int jumlahayat;
  final String tempat;
  final String arti;
  final List<Ayat>? ayat;
  // final String terjemahan;
  // final String audio;

  Surah({
    required this.number,
    required this.nama,
    required this.namalatin,
    required this.revelationType,
    required this.jumlahayat,
    required this.tempat,
    required this.arti,
    this.ayat,
    // required this.terjemahan,
    // required this.audio,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    var ayatList = json['ayat'] as List?;
    List<Ayat>? ayat = ayatList?.map((i) => Ayat.fromJson(i)).toList();
    return Surah(
      number: json['nomor'] as int,
      nama: json['nama'] as String,
      namalatin: json['nama_latin'] as String,
      revelationType: json['tempat_turun'] as String,
      jumlahayat: json['jumlah_ayat'] as int,
      tempat: json['tempat_turun'] as String,
      arti: json['arti'] as String,
      ayat: ayat, 
      // terjemahan: json['keterangan'] as String,
      // audio: json['audio'] as String,
    );
  }

  get namaLatin => null;
}

class Ayat {
  final int nomor;
  final String ar;
  final String tr;
  final String idn;

  Ayat({
    required this.nomor,
    required this.ar,
    required this.tr,
    required this.idn,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
      nomor: json['nomor'] as int,
      ar: json['ar'] as String,
      tr: json['tr'] as String,
      idn: json['idn'] as String,
    );
  }
}
