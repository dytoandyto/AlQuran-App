import 'package:alquran_api/surah_detail.dart';
import 'package:flutter/material.dart';
import 'api_service.dart';
import 'surah_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Surah>> _surahList;

  @override
  void initState() {
    super.initState();
    _surahList = _apiService.getSurah();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Al-Quran"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Surah>>(
        future: _surahList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final surahList = snapshot.data!;
            return ListView.builder(
              itemCount: surahList.length,
              itemBuilder: (context, index) {
                final surah = surahList[index];
                return ListTile(
                  title: Text("${surah.nama} (${surah.namalatin})"),
                  subtitle: Text("Jumlah Ayat: ${surah.jumlahayat}"),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PostDetail(post: surah)
                    )
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("Tidak ada data"));
          }
        },
      ),
    );
  }
}
