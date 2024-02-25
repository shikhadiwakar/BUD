import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  static const routeName = '/chat';

  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _chatHistory = [];


  static const String apiUrl =
      "https://steadfast-list-407119.el.r.appspot.com/send-message";

  void getAnswer() async {
    try {
      // Print the message to be sent to the API
      print('Message to send: ${_chatController.text}');

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'character': 'deadpool', // Provide the character value
          'message': _chatController.text, // Use the text from the text field
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          _chatHistory.add({
            "time": DateTime.now(),
            "message": json.decode(response.body)["reply"]["text"],
            "isSender": false,
          });
        });

        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        // Handle other non-200 status codes
      }
    } catch (e) {
      print('Error: $e');
      // Handle other types of errors
    }
  }



  Widget _buildMessageContainer(int index) {
    return Container(
      padding: EdgeInsets.only(
        left: 14,
        right: 14,
        top: 10,
        bottom: 10,
      ),
      child: Align(
        alignment: (_chatHistory[index]["isSender"]
            ? Alignment.topRight
            : Alignment.topLeft),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            color: _chatHistory[index]["isSender"]
                ? Color(0xFFC70C14) // Sender message box color
                : Color(0x662A2A2A), // Bot message box color
          ),
          padding: EdgeInsets.all(16),
          child: Text(
            _chatHistory[index]["message"],
            style: TextStyle(
              fontSize: 15,
              color: _chatHistory[index]["isSender"]
                  ? Colors.white
                  : Colors.white, // Change sender message font color
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInputContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      height: 60,
      width: double.infinity,
      color: Colors.black, // Background color
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                color: Colors.white, // Background color
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Type a message",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                  controller: _chatController,
                ),
              ),
            ),
          ),
          const SizedBox(width: 4.0),
          MaterialButton(
            onPressed: () {
              setState(() {
                if (_chatController.text.isNotEmpty) {
                  _chatHistory.add({
                    "time": DateTime.now(),
                    "message": _chatController.text,
                    "isSender": true,
                  });
                }
              });
              _scrollController.jumpTo(
                _scrollController.position.maxScrollExtent,
              );

              getAnswer();
            },
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
            padding: const EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                color: Color(0xFFC70C14), // Red color for send button
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              child: Container(
                constraints: const BoxConstraints(
                  minWidth: 88.0,
                  minHeight: 36.0,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC70C14), // Header background color
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,color: Colors.black,),
                ),
                SizedBox(width: 2,),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/dp1.jpg'),
                  maxRadius: 20,
                ),
                SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Deadpool",style: TextStyle( fontSize: 24 ,fontWeight: FontWeight.w600),),
                      SizedBox(height: 5,),
                    ],
                  ),
                ),
                Icon(Icons.settings,color: Colors.black54,),
              ],
            ),
          ),
        ),
      ),
    body: Container(
    color: Colors.black, // Background color for the entire chat body
    child: Column(
        children: [
          Expanded(
            child: Container(
              // Existing ListView.builder and Stack
              height: MediaQuery.of(context).size.height - 160,
              child: ListView.builder(
                itemCount: _chatHistory.length,
                shrinkWrap: false,
                controller: _scrollController,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildMessageContainer(index);
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildMessageInputContainer(),
          ),
        ],
      ),
    )
    );
  }
}
