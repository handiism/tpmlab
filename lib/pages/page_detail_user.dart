import 'package:flutter/material.dart';
import 'package:tpmlab/model/detail_user_model.dart';
import 'package:tpmlab/network/api_data_source.dart';

class PageDetailUser extends StatelessWidget {
  final int userId;

  const PageDetailUser({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail User'),
      ),
      body: _buildDetailUserBody(),
    );
  }

  Widget _buildDetailUserBody() {
    return FutureBuilder(
      future: ApiDataSource.instance.loadDetailUser(userId),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return _buildErrorSection();
        }
        if (snapshot.hasData) {
          DetailUserModel userData = DetailUserModel.fromJson(snapshot.data);
          return _buildSuccessSection(userData.data!);
        }
        return _buildLoadingSection();
      },
    );
  }

  Widget _buildErrorSection() {
    return const Text('Error');
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(Data usersData) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(usersData.avatar!),
            ),
            Text(
              '${usersData.firstName!} ${usersData.lastName!}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(usersData.email!, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
