import 'package:covid19demo/controllers/home_controller.dart';
import 'package:covid19demo/models/country_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Countries"),
        ),
        body: Obx(
          () => Stack(
            children: [
              ListView(
                  children: itemBuilder(homeController.data.value.response)),
              homeController.searchView.value
                  ? Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 5), // changes position of shadow
                            ),
                          ],
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      height: 300,
                      width: 400,
                      margin: const EdgeInsets.only(top: 50),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => {
                              homeController.onItemClick(
                                  homeController.searchItems[index])
                            },
                            child: ListTile(
                              title: Text(homeController.searchItems[index]),
                            ),
                          );
                        },
                        itemCount: homeController.searchItems.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            thickness: 2,
                          );
                        },
                      ),
                    )
                  : Container(),
              homeController.isLoading.value
                  ? Container(
                      color: Colors.white38.withOpacity(0.5),
                      height: double.infinity,
                      width: double.infinity,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> itemBuilder(List<String> countries) {
    List<Widget> itemViews = [];
    itemViews.add(
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 50,
          child: TextField(
            onChanged: (value) => homeController.showSearchResults(value),
            controller: textEditingController,
            decoration: const InputDecoration(
                hintText: "Search in countries",
                prefixIcon: Icon(Icons.search)),
          ),
        ),
      ),
    );

    for (var item in countries) {
      itemViews.add(Card(
        child: InkWell(
          onTap: () => homeController.onItemClick(item),
          child: ListTile(
            title: Text(item.toString()),
            leading: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.blue.shade100),
              child: Text((countries.indexOf(item) + 1).toString()),
            ),
          ),
        ),
      ));
    }
    return itemViews;
  }
}
