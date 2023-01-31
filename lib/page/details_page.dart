// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pocketbase_function/view/provider/post_provider.dart';

import '../constants/base_url.dart';

class DetailsPage extends StatefulWidget {
  final String id;
  const DetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SinglePostProvider>(context, listen: false)
          .providerSingleFetchPost(widget.id);
      Provider.of<SinglePostProvider>(context, listen: false)
          .providerAllCommentPost(widget.id);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<SinglePostProvider>(
              builder: (context, value, child) {
                return value.isLoading == false
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 150,
                            child: GridView.builder(
                              itemCount: value.singleUserPost?.imagePath.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (context, index) {
                                return value.singleUserPost?.id == null
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : Image.network(
                                        '${baseDB}api/files/${value.singleUserPost?.collectionId}/${value.singleUserPost?.id}/${value.singleUserPost?.imagePath[index]}');
                              },
                            ),
                          ),
                          Text('${value.singleUserPost?.title}'),
                          Text('${value.singleUserPost?.description}')
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
            const Text('Comments'),
            Consumer<SinglePostProvider>(
              builder: (context, value, child) {
                return SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: value.userComment.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                            title: Text(value.userComment[index].comments)),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
