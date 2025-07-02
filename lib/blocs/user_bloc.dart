import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_service.dart';
import '../services/database_service.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiService apiService;
  final DatabaseService dbService;

  UserBloc(this.apiService, this.dbService) : super(UserInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UserLoading());
      final localUsers = await dbService.getUsers();
      if (localUsers.isNotEmpty) {
        if (kDebugMode) {
          print('data is loaded from the local DB');
        }
        emit(UserLoaded(localUsers));
      } else {
        try {
          final users = await apiService.fetchUsers();
          await dbService.insertUsers(users);
          final localUsers = await dbService.getUsers();
          if (kDebugMode) {
            print('data is loaded from the online api');
          }
          emit(UserLoaded(localUsers));
        } catch (e) {
          emit(UserError('Failed to fetch users'));
        }
      }
    });

    on<SearchUsers>((event, emit) async {
      emit(UserLoading());
      final filteredUsers = await dbService.getUsers(query: event.query);
      emit(UserLoaded(filteredUsers));
    });
  }
}
