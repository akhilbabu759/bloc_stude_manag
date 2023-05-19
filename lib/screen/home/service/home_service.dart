import 'dart:developer';

import 'package:bloc_student_manage/screen/home/model/home_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService{
   dynamic result;
   List<HomeModel> datas=[];
 Future<List<HomeModel>> homeServiceFun()async{
        log('data[0].name');
    result  = await FirebaseFirestore.instance
        .collection('stud_manag')
        .get();
         for (var doc in result.docs) {
          datas.add(HomeModel.fromJson(doc.data()));

      
        
      }
      log(result.docs[0].data()['name']);
      return datas;

    }

  }
 
   
