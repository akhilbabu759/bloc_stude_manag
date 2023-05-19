import 'dart:developer';

import 'package:bloc_student_manage/screen/add/add.dart';
import 'package:bloc_student_manage/screen/home/controller/bloc/home_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(ValueGetSucces());
    });
    BlocProvider.of<HomeBloc>(context).add(ValueGetSucces());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddScree(),
            ));
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 21, 21, 27),
              Color.fromARGB(255, 32, 103, 133),
            ],
          )),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                      child: Text(
                    'BloMa',
                    style: TextStyle(fontSize: 30, letterSpacing: 2),
                  )),
                ),
              ),
              Expanded(child:
                  BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                return state.homeData.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                  itemCount: state.homeData.length,
                  itemBuilder: (context, index) =>  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: ListTile(
                              // tileColor: Colors.white,
                              leading: Text(
                                state.homeData[index].name,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                          )),
                );
              }))
            ],
          ),
        ));
  }
}
