import 'package:companies_management_app/app_cubit/app_cubit.dart';
import 'package:companies_management_app/app_cubit/app_states.dart';
import 'package:companies_management_app/core/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var appCubit = AppCubit.get(context);
        Size size = MediaQuery.of(context).size;

        return Scaffold(
          appBar: appCubit.currentIndex == 2
              ? PreferredSize(
                  preferredSize: size,
                  child: customAppBar(size: size, context: context))
              : AppBar(
                  backgroundColor: Colors.blue,
                  title: Text(appCubit.title[appCubit.currentIndex],
                      style: const TextStyle(color: Colors.white)),
                ),
          body: appCubit.bottomScreen[appCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 25.0,
            items: appCubit.bottomItems,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: appCubit.currentIndex,
            onTap: (index) => appCubit.changeBottom(index),
          ),
        );
      },
    );
  }
}
