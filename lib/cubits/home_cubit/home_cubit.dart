import 'package:api_with_bloc/repositories/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/home_reponse_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());


  void getHomeData() async {
    emit(LoadingHomeState());

    final response = await HomeRepository().getHomeData();
    // Serializing - Modelling
    final homeData = HomeResponse.fromJson(response);

    emit(HomeDataSuccess(homeData));
  }
}
