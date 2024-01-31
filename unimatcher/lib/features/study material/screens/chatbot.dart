import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:velocity_x/velocity_x.dart';

import 'chatmessage.dart';
import 'threedots.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

Widget _buildTextComposer() {
  return Row(
    children: [
      Expanded(
        child: TextField(
          onSubmitted: (value) {},
          decoration:
              const InputDecoration.collapsed(hintText: "Question/description"),
        ),
      ),
      ButtonBar(
        children: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {},
          ),
          TextButton(onPressed: () {}, child: const Text("Generate Image"))
        ],
      ),
    ],
  ).px16();
}

@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: const Text("ChatGPT & Dall-E2 Demo")),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
              reverse: true,
              padding: Vx.m8,
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {},
            )),
            const Divider(
              height: 1.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: context.cardColor,
              ),
              child: _buildTextComposer(),
            )
          ],
        ),
      ));
}
