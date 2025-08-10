import 'package:bloc_network_example/bloc/user_event.dart';
import 'package:bloc_network_example/bloc/user_state.dart';
import 'package:bloc_network_example/model/user.dart';
import 'package:bloc_network_example/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//UserBlock, Bloc sınıfından türetilmiştir. İki ana parametre içerir:
// Event (UserEvent) → Kullanıcıdan gelen olaylar.
// State (UserState) → UI’nin durumunu belirten veri.
class UserBlock extends Bloc<UserEvent, UserState> {
  // UserRepository, kullanıcı verisini sağlayan bir bağımlılıktır.
  // Başlangıç durumu (super(UserEmptyState())), ilk durumda
  //veri olmadığı için UserEmptyState olarak belirlenmiştir.
  final UserRepository userRepository;
  UserBlock({required this.userRepository}) : super(UserEmptyState()) {
    on<UserLoadEvent>((event, emit) async {
      emit(UserLoadingState()); // Yüklenme durumuna geçiş
      try {
        final List<User> loadedUsersList = await userRepository.getAllUsers();
        emit(UserLoadedState(loadedUser: loadedUsersList)); // Veri başarıyla alındı

      } catch (_) {
        emit(UserErrorState());
      }
    });

    //- Kullanıcı verisi temizlendiğinde UserEmptyState aktif hale gelir.
    on<UserClearEvent>((event, emit) async {
      emit(UserEmptyState()); // Hata durumu
     
    });
  }
}
// UserLoadEvent tetiklendiğinde:
// Yüklenme durumu (UserLoadingState) aktif hale gelir.
// UserRepository’den veri çekilir.
// Veri çekme başarılıysa UserLoadedState ile UI güncellenir.
// Hata olursa UserErrorState devreye girer.

