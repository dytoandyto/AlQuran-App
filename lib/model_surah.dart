// import 'package:flutter/material.dart';
// import 'api_service.dart';
// import 'surah_model.dart';

// class DetailPage extends StatelessWidget {
//   final ApiService httpService = ApiService();
//   final int nomor;

//   DetailPage({required this.nomor});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Detail Surah"),
//       ),
//       body: FutureBuilder(
//         future: httpService.getSurah(),
//         builder: (BuildContext context, AsyncSnapshot<Post> snapshot) {
//           if (snapshot.hasData) {
//             Surah detail = snapshot.data!;

//             return SingleChildScrollView(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "${detail.arti}. ${detail.namalatin}",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     detail.nama,
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.grey[700],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     "Arti: ${detail.arti}",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     "Jumlah ayat: ${detail.jumlahayat}",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     "Tempat turun: ${detail.tempat}",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   if (detail.ayat != null)
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: detail.ayat!.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         Ayat ayat = detail.ayat![index];
//                         return Card(
//                           margin: EdgeInsets.only(bottom: 10),
//                           child: Padding(
//                             padding: EdgeInsets.all(16),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // Tambahkan nomor ayat di sini
//                                 Text(
//                                   "Ayat ${ayat.nomor}",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.blue,
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   ayat.ar,
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                   textAlign: TextAlign.right,
//                                 ),
//                                 // SizedBox(height: 10),
//                                 // Text(
//                                 //   ayat.tr,
//                                 //   style: TextStyle(
//                                 //     fontSize: 16,
//                                 //     color: Colors.grey[700],
//                                 //   ),
//                                 // ),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   ayat.idn,
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.grey[700],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                 ],
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text("Error: ${snapshot.error}"),
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }


// class Post {
//   final int nomor;
//   final String nama;
//   final String nama_latin;
//   final int jumlah_ayat;
//   final String tempat_turun;
//   final String arti;
//   final List<Ayat>? ayat;

//   Post({
//     required this.nomor,
//     required this.nama,
//     required this.nama_latin,
//     required this.jumlah_ayat,
//     required this.tempat_turun,
//     required this.arti,
//     this.ayat,
//   });

//   factory Post.fromJson(Map<String, dynamic> json) {
//     var ayatList = json['ayat'] as List?;
//     List<Ayat>? ayat = ayatList?.map((i) => Ayat.fromJson(i)).toList();

//     return Post(
//       nomor: json['nomor'] as int,
//       nama: json['nama'] as String,
//       nama_latin: json['nama_latin'] as String,
//       jumlah_ayat: json['jumlah_ayat'] as int,
//       tempat_turun: json['tempat_turun'] as String,
//       arti: json['arti'] as String,
//       ayat: ayat,
//     );
//   }
// }

// class Ayat {
//   final int nomor;
//   final String ar;
//   final String tr;
//   final String idn;

//   Ayat({
//     required this.nomor,
//     required this.ar,
//     required this.tr,
//     required this.idn,
//   });

//   factory Ayat.fromJson(Map<String, dynamic> json) {
//     return Ayat(
//       nomor: json['nomor'] as int,
//       ar: json['ar'] as String,
//       tr: json['tr'] as String,
//       idn: json['idn'] as String,
//     );
//   }
// }