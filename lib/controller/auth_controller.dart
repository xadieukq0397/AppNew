import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:get/state_manager.dart';
import 'package:responsive_login_ui/data/model/user.dart';
import 'package:responsive_login_ui/data/repository/auth_repo.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  List<User> _user = [];
  List<User> get user => _user;

  Future<void> createUserToDB() async {
    List<User>? users = [
      User(
        id: '1',
        email: 'lylysury2109@gmail.com',
        name: "Lyly Sury",
        image:
            'https://scontent.fhan9-1.fna.fbcdn.net/v/t39.30808-6/296428366_611605277001287_7601256546827928608_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=uHDC2nmFHuwAX_MxfTM&_nc_ht=scontent.fhan9-1.fna&oh=00_AT-sQrErEAaBhdW4dPFpiy77JvL1sZoyVZs9kEc9WOzyBw&oe=634F9568',
        phone: '0372141736',
        address: 'Hà Nội',
      ),
      User(
        id: '2',
        email: 'hoptac.social@gmail.com',
        name: "An Hy",
        image:
            'https://scontent.fhan9-1.fna.fbcdn.net/v/t39.30808-6/277799821_456057326342785_3372839772085287597_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=cAiCzmwIyUcAX9m7PIg&tn=ueSg955agN1rSwxw&_nc_ht=scontent.fhan9-1.fna&oh=00_AT-9jwRU5z8GGg9YZjJ1JDi29orpZwKPKWFDbGZahrevRQ&oe=634E905B',
        phone: '0736096547',
        address: 'Hà Nội',
      )
    ];

    if (users.isNotEmpty) {
      await authRepo.createUserToDB(users: users);
      print("Create user to DB");
    }
  }

  Future<void> readAllUserFromDB() async {
    List<User>? listUsers = await authRepo.readAllProductFromDB();
    _user = [];
    for (var user in listUsers!) {
      _user.add(user);
    }
    _user.forEach((element) {
      print(element.name);
    });
    update();
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
