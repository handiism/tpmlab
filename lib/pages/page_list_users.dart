import 'package:flutter/material.dart';
import 'package:tpmlab/model/users_model.dart';
import 'package:tpmlab/network/api_data_source.dart';
import 'package:tpmlab/pages/page_detail_user.dart';

class PageListUsers extends StatelessWidget {
  const PageListUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Dari User'),
      ),
      body: _buildListUsersBody(),
    );
  }
}

Widget _buildListUsersBody() {
  return FutureBuilder(
    future: ApiDataSource.instance.loadUsers(),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if (snapshot.hasError) {
        return _buildErrorSection();
      }
      if (snapshot.hasData) {
        UsersModel usersModel = UsersModel.fromJson(snapshot.data);
        return _buildSuccessSection(usersModel);
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

Widget _buildSuccessSection(UsersModel users) {
  return ListView.builder(
    itemCount: users.data!.length,
    itemBuilder: (context, index) {
      return _buildItemUsers(users.data![index], context);
    },
  );
}

Widget _buildItemUsers(Data userData, context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageDetailUser(userId: userData.id!),
        ),
      );
    },
    child: Card(
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Image.network(userData.avatar!),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${userData.firstName!} ${userData.lastName!}"),
              Text(userData.email!),
            ],
          ),
        ],
      ),
    ),
  );
}
