import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/app/database/database_todo.dart';
import 'package:todo/app/models/model_task.dart';

class HomeController extends GetxController {
  var currentSelected = 0.obs;
  late TextEditingController taskCtrl;
  var lenghtList = 1.obs;
  var taskDone = 0.obs;
  List<Icon> icons = [
    Icon(Icons.person, color: Color.fromARGB(255, 9, 190, 223)),
    Icon(Icons.card_travel, color: Color.fromARGB(255, 9, 190, 223)),
    Icon(Icons.movie, color: Color.fromARGB(255, 9, 190, 223)),
    Icon(Icons.snowmobile_sharp, color: Color.fromARGB(255, 9, 190, 223)),
    Icon(Icons.directions_bus_filled, color: Color.fromARGB(255, 9, 190, 223)),
    Icon(Icons.shopping_cart, color: Color.fromARGB(255, 9, 190, 223)),
  ];
  var listData = <ModelTask>[].obs;
  final chipIndex = 0.obs;
  final deleting = false.obs;
  DatabaseInstance databaseInstance = DatabaseInstance();

  addNewList(ModelTask paramTask) async {
    listData.add(paramTask);
    taskCtrl.clear();

    currentSelected.value = 0;
    Get.back();
  }

  checkListData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? savePref = sharedPreferences.getStringList('data');
    if (savePref != null) {
      print(savePref.map((e) => ModelTask.fromJson(json.decode(e))).toList());
    }
  }

  void changeChipIndex(int value) {
    chipIndex.value = value;
  }

  void changeDeleting(bool value) {
    deleting.value = value;
  }

  Future<List<ModelTask>> fetchDataFromDatabaseInstance() async {
    try {
      listData.clear();

      // Pastikan untuk menambahkan await di sini
      await databaseInstance.getDatabase();

      // set data
      List<ModelTask> task = await databaseInstance.getDataModelTask();

      // setting data
      listData.value = task;
      listData.refresh();

      lenghtList.value = listData.length;

      int done = 0;
      for (var element in listData) {
        int curLength = element.content!.length;
        String title = element.title;
        int lenght = 0;
        print(title);
        for (var data in element.content!) {
          if (data.isDone == 1) {
            lenght++;
          }
          print("$curLength == $lenght");
          if (lenght == curLength) {
            done++;
            print('selesai $title');
          }
        }
      }
      taskDone.value = done;

      return task;
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    print('database onInit');
    try {
      await databaseInstance.getDatabase();
      fetchDataFromDatabaseInstance();
    } catch (e) {
      throw ('Error initializing database init onInit: $e');
    }

    // textfield
    taskCtrl = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    taskCtrl.dispose();
    super.onClose();
  }
}
