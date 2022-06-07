import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutor_live/core/global_widgets/textfield.dart';

import '../../home/controller/homepage_controller.dart';

class ChatDetails extends StatefulWidget {
  const ChatDetails({Key? key}) : super(key: key);

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  final sender = Get.arguments![0];
  final receiver = Get.arguments![1];
  final message = Get.arguments![2];

  final controller = Get.find<HomePageController>();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.red),
        backgroundColor: Colors.transparent,
        title: Text('Chat',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
          future: controller.apiRepositoryInterface.getChatDetails(sender),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
              (snapshot.hasData)
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) => Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            message,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Get.width * 0.8,
              child: CustomTextField(
                controller: messageController,
                hintText: 'Type here',
                icon: Icons.message_rounded,
                obscureText: false,
              ),
            ),
            IconButton(
                onPressed: () {
                  controller.apiRepositoryInterface
                      .sendChat(receiver, messageController.text);

                  setState(() {});
                  messageController.clear();
                },
                icon: const Icon(Icons.send_rounded)),
          ],
        ),
      ],
    );
  }
}
