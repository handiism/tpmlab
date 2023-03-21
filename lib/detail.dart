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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Judul\t\t\t\t\t: ${buku.title}"),
                    Text("Judul\t\t\t\t\t: ${buku.author}"),
                    Text("Judul\t\t\t\t\t: ${buku.author}"),
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
