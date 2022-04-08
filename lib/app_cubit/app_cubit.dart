import 'package:companies_management_app/app_cubit/app_states.dart';
import 'package:companies_management_app/core/dio_helper.dart';
import 'package:companies_management_app/models/companies_model.dart';
import 'package:companies_management_app/screens/chats_screen.dart';
import 'package:companies_management_app/screens/group_screen.dart';
import 'package:companies_management_app/screens/home_screen.dart';
import 'package:companies_management_app/screens/recent_screen.dart';
import 'package:companies_management_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  //_____________________________________________________
  int currentIndex = 2;

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  List<String> title = [
    'Recent',
    'Chats',
    'Home',
    'Group',
    'Settings',
  ];

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.access_time_filled), label: 'Recent'),
    const BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Group'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> bottomScreen = [
    const RecentScreen(),
    const ChatsScreen(),
    const HomeScreen(),
    const GroupScreen(),
    const SettingsScreen(),
  ];

  //_____________________________________________________

  CompaniesModel? companiesModel;

  void getHomeData() {
    DioHelper.postData(
      url: 'companies',
    ).then((value) {
      companiesModel = CompaniesModel.fromJson(value.data);
      emit(SuccessHomeDataState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(ErrorHomeDataState());
    });
  }
}
