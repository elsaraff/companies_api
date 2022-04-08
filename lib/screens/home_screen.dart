import 'package:companies_management_app/app_cubit/app_cubit.dart';
import 'package:companies_management_app/app_cubit/app_cubit.dart';
import 'package:companies_management_app/app_cubit/app_states.dart';
import 'package:companies_management_app/core/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var appCubit = AppCubit.get(context);
        if (appCubit.companiesModel == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) => companyItem(
                  appCubit.companiesModel!.companiesList[index],
                ),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: appCubit.companiesModel!.companiesList.length,
              ),
            ),
          );
        }
      },
    );
  }
}
