import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_student_manage/screen/home/model/home_model.dart';
import 'package:bloc_student_manage/screen/home/service/home_service.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(isGet: false,homeData: [])) {
    on<ValueGet>((event, emit) {
      emit(HomeState(isGet: true,homeData: []));
      
    });
     on<ValueGetSucces>((event, emit) async{
      log('data[0].name');
      List<HomeModel>lis=await HomeService().homeServiceFun();
      emit(HomeState(isGet: false,homeData:lis));
      // log()
      
    });
  }
}
