import 'package:bloc_network_example/bloc/user_block.dart';
import 'package:bloc_network_example/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocBuilder, UserBlock içindeki durumları (State) dinleyerek UI'yi günceller.
    // builder fonksiyonu, state parametresiyle mevcut durumu alır.
    return BlocBuilder<UserBlock, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Center(child: Text('No data received. Press "Load" button'));
        }
        if (state is UserLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.blue[50] : Colors.blue[100],
              child: ListTile(
                leading: Text(
                  'ID: ${state.loadedUser[index].id}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                title: Column(
                  children: [
                    Text(
                      'Name: ${state.loadedUser[index].name}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Email: ${state.loadedUser[index].email ?? ''}',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Text(
                      'Phone: ${state.loadedUser[index].phone ?? ''}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is UserErrorState) {
          return Center(child: Text('Error fetching users'));
        }
        // Eğer hiçbir duruma uymuyorsa, boş bir widget (SizedBox.shrink()) döndürülür.
        return SizedBox.shrink();
      },
    );
  }
}
/*
Genel Çalışma Mantığı
📌 BlocBuilder, UserBlock içinde değişen UserState değerine göre UI'yi günceller.
📌 Her State için farklı UI bileşenleri gösterilir (Yükleme, hata, listeleme vb.).
📌 Veri başarılı gelirse, ListView ile ekranda gösterilir.

Sonuç
Bu kod, Flutter’da BLoC mimarisi ile durum yönetimini etkili bir şekilde kullanıyor. 
Kullanıcı listesini dinamik olarak güncelliyor, farklı state’lere uygun UI gösteriyor ve modüler yapıyı koruyor.
*/