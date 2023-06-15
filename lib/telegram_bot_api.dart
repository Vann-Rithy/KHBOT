import 'package:http/http.dart' as http;
import 'dart:convert';

class TelegramBotApi {
  static const String _baseUrl =
      'https://api.telegram.org/bot5808032935:AAGtuoUiMXUI47pgctOzu86htyQsFIaNH4s/sendMessage?chat_id=5110093561/';

  final String _accessToken;

  TelegramBotApi(this._accessToken);

  Future<http.Response> _sendRequest(
      String method, Map<String, String> params) async {
    final response = await http.post(
      Uri.parse('$_baseUrl$_accessToken/$method'),
      body: params,
    );
    return response;
  }

  Future<http.Response> sendMessage(String chatId, String text) async {
    final params = {
      'chat_id': chatId,
      'text': text,
    };
    final response = await _sendRequest('sendMessage', params);
    return response;
  }

  // Add more API endpoints as needed
}
