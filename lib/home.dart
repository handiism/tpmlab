import 'package:flutter/material.dart';
import 'package:tpmlab/data_buku.dart';
import 'package:tpmlab/detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Buku"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, i) {
          var buku = listBuku[i];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                print("object");
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Detail(
                      index: i,
                    ),
                  ),
                );
                print("object");
              },
              child: Row(
                children: [
                  Image.network(
                    buku.imageLink,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          buku.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        const Divider(
                          color: Colors.transparent,
                          height: 1,
                        ),
                        Text(
                          buku.author,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: listBuku.length,
      ),
    );
  }
}
