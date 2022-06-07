import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/controller/homepage_controller.dart';

class ChatFrame extends StatelessWidget {
  ChatFrame({Key? key}) : super(key: key);
  final controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: FutureBuilder(
        future: controller.apiRepositoryInterface.getChatHeads(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
            (snapshot.hasData)
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) => Card(
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 15,
                          child: CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person, color: Colors.red),
                          ),
                        ),
                        title: Text(snapshot.data![index]!.message),
                        onTap: () {
                          Get.toNamed('/chatDetails', arguments: [
                            snapshot.data![index]!.sender,
                            snapshot.data![index]!.receiver,
                            snapshot.data![index]!.message,
                          ]);
                        },
                      ),
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
