import 'package:bloc_network_example/model/user.dart';
import 'package:bloc_network_example/services/user_api_provider.dart';

// UserRepository sınıfı, veri erişimini yöneten bir katmandır.
// UserProvider ile etkileşime geçerek API’den veri çeker.
// _userProvider adlı private bir nesne oluşturulur.
// UserProvider sınıfını burada bağımlılık olarak enjekte ediyoruz.
// Böylece UserRepository, UserProvider sınıfı üzerinden veri alabilir.
// getAllUsers() metodu, asenkron olarak çalışır ve Future<List<User>> döndürür.
// UserProvider sınıfındaki getUsers() metodunu çağırarak API’den kullanıcıları çeker.
class UserRepository {
  final UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers() => _userProvider.getUsers();
}
