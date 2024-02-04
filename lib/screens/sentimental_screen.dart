import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SentimentalScreen extends StatefulWidget {
  @override
  _SentimentalScreenState createState() => _SentimentalScreenState();
}

class _SentimentalScreenState extends State<SentimentalScreen> {
  TextEditingController _textController = TextEditingController();
  String _response = '';

  Future<void> _sendDataToApi(String inputData) async {
    // Replace with your API endpoint
    final String apiUrl = 'https://your-api-endpoint.com';

    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode({'inputData': inputData}),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      setState(() {
        _response = responseData['message'];
      });
    } else {
      setState(() {
        _response = 'Failed to send data to API';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Integration'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(_response),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Enter text',
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final inputData = _textController.text;
                    if (inputData.isNotEmpty) {
                      _sendDataToApi(inputData);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
