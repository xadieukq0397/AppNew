import '../model/user.dart';
import '../provider/db/storage_database.dart';

class AuthRepo {
  Future<void> createUserToDB({List<User>? users}) async {
    for (int i = 0; i < users!.length; i++) {
      if (users[i] is User) {
        User? user;
        user = await readUserByIDFromDB(id: users[i].id);
        if (user == null) {
          await StorageDatabase.instance.createUserToDB(users[i]);
        }
      }
    }
  }

  Future<User?> readUserByIDFromDB({String? id}) async {
    User? user = await StorageDatabase.instance.readUserByIDFromDB(id);
    return user;
  }

  Future<List<User>?> readAllProductFromDB() async {
    List<User>? users = [];
    users = await StorageDatabase.instance.readAllUserFromDB();
    return users;
  }
}
