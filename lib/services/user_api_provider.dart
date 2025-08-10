import 'dart:convert';
import 'package:bloc_network_example/model/user.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  // https://jsonplaceholder.typicode.com/users
  // http.get() fonksiyonu ile belirtilen API URL'sine GET isteği gönderilir.
  // await ile çağrıldığı için işlem tamamlanana kadar bekler.
  // Uri.parse() kullanarak URL'yi doğru formatta oluşturur.

  Future<List<User>> getUsers() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    // Eğer isteğin yanıt kodu 200 (Başarılı) ise, JSON verisi alınır ve işlenir.
    // response.body, API'den dönen ham JSON verisini içerir.
    // jsonDecode() ile bu veri Dart listesine (List<dynamic>) çevrilir.
    // Map fonksiyonu ile her JSON objesi, User.fromMap(json) metodunu çağırarak User nesnesine dönüştürülür.
    // Sonuç olarak, List<User> türünde bir liste döndürülür.
    if (response.statusCode == 200) {
      final List<dynamic> userJson = jsonDecode(response.body);
      return userJson.map((json) => User.fromMap(json)).toList();
    } else {
      throw Exception('Error fetching data');
    }
  }
}
