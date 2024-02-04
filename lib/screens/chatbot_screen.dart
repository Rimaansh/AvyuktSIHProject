import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatbotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avyukt',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white, // Background color
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Chatbot'),
        ),
        body: YourCustomWidget(),
      ),
    );
  }
}

class Message {
  final String role;
  final String content;

  Message(this.role, this.content);
}

class YourCustomWidget extends StatefulWidget {
  @override
  _YourCustomWidgetState createState() => _YourCustomWidgetState();
}

class _YourCustomWidgetState extends State<YourCustomWidget> {
  String? sourceId;
  final TextEditingController questionController = TextEditingController();
  List<Message> messages = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    addPDFViaURL();
  }

  Future<void> addPDFViaURL() async {
    final url = Uri.parse('https://api.chatpdf.com/v1/sources/add-url');
    final headers = {
      'x-api-key':
          'sec_y0yJRh4Zaj679thEYaOz3laeS08FgiGa', // Replace with your API key
      'Content-Type': 'application/json',
    };
    // final data = {'url': 'https://commed.vcu.edu/IntroPH/MentalHealth/definingMI_may06.pdf'};
    final data = {
      'url':
          'https://apps.who.int/iris/bitstream/handle/10665/42823/9241562579.pdf'
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      final sourceId = jsonDecode(response.body)['sourceId'];
      setState(() {
        this.sourceId = sourceId;
      });
      print('Source ID: $sourceId');
    } else {
      print('Status: ${response.statusCode}');
      print('Error: ${response.body}');
    }
  }

  Future<void> askQuestion() async {
    if (sourceId != null) {
      final url = Uri.parse('https://api.chatpdf.com/v1/chats/message');
      final headers = {
        'x-api-key':
            'sec_y0yJRh4Zaj679thEYaOz3laeS08FgiGa', // Replace with your API key
        'Content-Type': 'application/json',
      };
      final data = {
        'sourceId': sourceId!,
        'messages': [
          {
            'role': 'user',
            'content': questionController.text,
          },
        ],
      };

      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final content = jsonDecode(response.body)['content'];
        setState(() {
          messages.add(Message('Me', questionController.text));
          messages.add(Message('Your Personal AI Assistant', content));
        });
        questionController.clear();
        print('Answer: $content');
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      } else {
        print('Status: ${response.statusCode}');
        print('Error: ${response.body}');
      }
    } else {
      print('Please add a PDF via URL first');
    }

    // Automatically dismiss the keyboard
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              final message = messages[index];
              final role = message.role;
              final content = message.content;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Row(
                  mainAxisAlignment: role == 'Me'
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    if (role == 'Me')
                      Expanded(
                        child: SizedBox(), // Empty space for alignment
                      ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: role == 'Me' ? Colors.blue : Colors.green,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              role,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              content,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (role != 'Me')
                      Expanded(
                        child: SizedBox(), // Empty space for alignment
                      ),
                  ],
                ),
              );
            },
          ),
        ),
        Divider(height: 1),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: questionController,
                  decoration: InputDecoration(
                    hintText: 'Enter your question',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () async {
                  await askQuestion();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
