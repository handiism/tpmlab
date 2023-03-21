import 'package:flutter/material.dart';
import 'package:tpmlab/tourism_place.dart';

class HalamanDetail extends StatelessWidget {
  final TourismPlace place;
  const HalamanDetail({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(place.name.toString()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: place.imageUrls.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Image.network(place.imageUrls[index]);
                  },
                ),
              ),
              Text(place.location),
              Text(place.openDays),
              Text(place.openDays),
              Text(place.description)
            ],
          ),
        ));
  }
}
