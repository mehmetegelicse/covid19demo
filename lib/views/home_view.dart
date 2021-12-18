import 'package:covid19demo/controllers/home_controller.dart';
import 'package:covid19demo/models/country_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countries"),
      ),
      body: Obx(
        () => homeController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Center(
                    child: GestureDetector(
                      onTap: () => homeController.onItemClick(
                          homeController.data.value.response[index]),
                      child: Card(
                        child: ListTile(
                          title: Text(homeController.data.value.response[index]
                              .toString()),
                          leading: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.blue.shade100),
                            child: Text(
                              "${index + 1}",
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: homeController.data.value.response.length,
              ),
      ),
    );
  }
}
