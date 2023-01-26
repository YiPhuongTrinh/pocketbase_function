import 'package:pocketbase/pocketbase.dart';
import 'package:pocketbase_function/model/user_model.dart';

import '../constants/base_url.dart';

final pb = PocketBase(baseDB);

class APILogin {
  fetchData(String id) async {
    final record = await pb
        .collection('users')
        .getOne(id)
        .then((value) => UserModel.fromRecord(value));

    return record;
  }
}
