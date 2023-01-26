// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:pocketbase_function/constants/base_url.dart';
import 'package:pocketbase_function/model/user_repository.dart';

import '../model/user_model.dart';

final pb = PocketBase(baseDB);

class HomePage extends StatefulWidget {
  final String id;
  const HomePage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserModel _userModel;
  @override
  void initState() {
    _userModel = APILogin().fetchData(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.id)),
        body: ElevatedButton(
            onPressed: () {
              print(_userModel);
            },
            child: const Text('Press me')));
  }
}
