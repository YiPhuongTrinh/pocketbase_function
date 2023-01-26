// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:pocketbase_function/constants/base_url.dart';
import 'package:pocketbase_function/model/user_data.dart';
import 'package:pocketbase_function/view/provider/login_provider.dart';
import 'package:pocketbase_function/view/provider/post_provider.dart';
import 'package:provider/provider.dart';

import '../model/user_repository.dart';
import 'login_page.dart';

final pb = PocketBase(baseDB);

class HomePage extends StatefulWidget {
  final String id;
  final String? token;
  const HomePage({
    Key? key,
    required this.id,
    this.token,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<UserData> model;
  String name = '';
  @override
  void initState() {
    // PostProvider().fetchAllPost();
    // _userPost = PostProvider().fetchAllPost();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PostProvider>(context, listen: false).providerFetchPost();
    });
    model = APILogin().fetchData(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // List<UserPost> userPost = context.watch<PostProvider>().userPost;
    // final UserModel userModel = context.read<LoginProvider>().userModel;
    return FutureBuilder(
      future: model,
      builder: (context, snapshot) {
        final db = snapshot.data;
        return snapshot.hasData
            ? Scaffold(
                appBar: AppBar(
                  title: Text('${db?.name}'),
                  actions: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        '${baseDB}api/files/${db?.collectionName}/${db?.id}/${db?.avatar}',
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          context.read<LoginProvider>().userLogout();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ));
                        },
                        icon: const Icon(Icons.logout_outlined)),
                  ],
                ),
                body: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      // Text(context.watch<LoginProvider>().isValid.toString()),
                      Expanded(
                        child: Consumer<PostProvider>(
                          builder: (context, item, child) {
                            return PostProvider().isLoading == false
                                ? ListView.builder(
                                    itemCount: item.userPost.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        child: ListTile(
                                          title:
                                              Text(item.userPost[index].title),
                                          subtitle: Text(
                                              item.userPost[index].description),
                                          trailing: Image.network(
                                              '${baseDB}api/files/${item.userPost[index].collectionId}/${item.userPost[index].id}/${item.userPost[index].imagePath[0]}'),
                                        ),
                                      );
                                    },
                                  )
                                : const Center(
                                    child: CircularProgressIndicator());
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
