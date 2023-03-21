import 'package:flutter/material.dart';
import 'package:tpmlab/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatefulWidget {
  final int index;
  const Detail({super.key, required this.index});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    DataBuku buku = listBuku[widget.index];
    return Scaffold(
      appBar: AppBar(
        title: Text(buku.title),
        actions: [
          IconButton(
            onPressed: () async {
              var x = await launchUrl(Uri.parse(buku.link));
              print(x);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(buku.imageLink),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Judul          : ${buku.title}",
                    ),
                    Text(
                      "Penulis        : ${buku.author}",
                    ),
                    Text(
                      "Bahasa         : ${buku.language}",
                    ),
                    Text(
                      "Negara         : ${buku.country}",
                    ),
                    Text(
                      "Jumlah Halaman : ${buku.pages}",
                    ),
                    Text(
                      "Tahun Terbit   : ${buku.year}",
                    ),
                    Text(
                      "Status         : ${buku.isAvailable ? "Tersedia" : "Tidak Tersedia"}",
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (buku.isAvailable) {
                            listBuku[widget.index].isAvailable = false;
                          }
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor: buku.isAvailable
                              ? MaterialStateProperty.all(Colors.blue)
                              : MaterialStateProperty.all(Colors.grey)),
                      child: const Text(
                        "Pinjam Buku",
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
