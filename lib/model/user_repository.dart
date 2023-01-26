import 'package:pocketbase/pocketbase.dart';
import 'package:pocketbase_function/model/user_data.dart';

import '../constants/base_url.dart';

final pb = PocketBase(baseDB);

class APILogin {
  late UserData model;
  Future<UserData> fetchData(String id) async {
    final record = await pb.collection('users').getOne(id).then((value) {
      print(value);
      return UserData.fromRecord(value);
    }).catchError((onError) {
      return print(onError);
    });
    return record;
  }
}
