import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/app/database/database_todo.dart';
import 'package:uuid/uuid.dart';
import '../constant/default.dart';
import '../modules/home/controllers/home_controller.dart';

class AddView extends StatelessWidget {
  const AddView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var home = Get.put(HomeController());
    // ignore: unused_local_variable
    Icon iconSelected = home.icons[0];
    // ignore: unused_local_variable
    int iconIndex = 0;

    return Container(
      width: (Get.width - 12.0) / 2,
      height: (Get.width - 12.0) / 2,
      margin: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: () {
          Get.defaultDialog(
            title: 'Task Type',
            titleStyle: GoogleFonts.outfit(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
            titlePadding: const EdgeInsets.all(20),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            content: Column(
              children: [
                TextFormField(
                  style: GoogleFonts.poppins(),
                  controller: home.taskCtrl,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your rask title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      'Title',
                      style: GoogleFonts.poppins(),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  ),
                ),
                const Gap(10),
                Wrap(
                  children: home.icons.asMap().entries.map((icon) {
                    print(icon.key);
                    return Obx(
                      () => GestureDetector(
                        onTap: () {
                          home.currentSelected.value = icon.key;
                          iconSelected = icon.value;
                          iconIndex = icon.key;
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: (home.currentSelected.value == icon.key)
                                ? Colors.grey.shade300
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: icon.value,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const Gap(10),
                Material(
                  color: primaryContainerColor,
                  borderRadius: BorderRadius.circular(30),
                  child: InkWell(
                    onTap: () async {
                      try {
                        DatabaseInstance databaseInstance = DatabaseInstance();
                        Uuid uuid = Uuid();

                        await databaseInstance.getDatabase();
                        await databaseInstance.insertTask({
                          "uuid": uuid.v1(),
                          "title": home.taskCtrl.text,
                          "icons": iconIndex,
                        });

                        home.taskCtrl.clear();
                        home.fetchDataFromDatabaseInstance();
                        Get.back();
                      } catch (e) {
                        throw ("Error document $e");
                      }
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Center(
                        child: Text(
                          'Confirm',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        child: DottedBorder(
          borderType: BorderType.RRect,
          padding: EdgeInsets.all(6),
          color: Colors.grey,
          strokeWidth: 2,
          child: Center(
            child: Icon(
              Icons.add,
              size: 50,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
