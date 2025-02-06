import 'package:flutter/material.dart';
import 'surah_model.dart';

class PostDetail extends StatelessWidget {
  final Surah post;

  PostDetail({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Surah"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: CircleAvatar(
                        child: Text(post.number.toString()),
                      ),
                    ),
                    ListTile(
                      title: const Text("Nama"),
                      subtitle: Text(
                        post.nama,
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    ListTile(
                      title: const Text("Nama latin"),
                      subtitle: Text(
                        post.namalatin,
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    ListTile(
                      title: const Text("Arti"),
                      subtitle: Text(post.arti),
                    ),
                    ListTile(
                      title: const Text("Jumlah Ayat"),
                      subtitle: Text(
                        post.jumlahayat.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    ListTile(
                      title: const Text("Tempat Turun"),
                      subtitle: Text(post.revelationType),
                    ),
                    ListTile(
                      title: const Text("Body"),
                      subtitle: Text(post.revelationType),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              if (post.ayat != null) 
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: post.ayat!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Ayat ayat = post.ayat![index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Text(
                              "Ayat ${ayat.nomor}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              ayat.ar,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
