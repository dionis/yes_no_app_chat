import 'package:dio/dio.dart';
import 'package:yes_no_app_chat/domain/entities/messages.dart';
import 'package:yes_no_app_chat/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();
  final yesNoApi = 'https://yesno.wtf/api';

  Future<Message> getAnswer() async {
    final response = await _dio.get(yesNoApi);

    //Important OJO
    //Way to hide the logic in JSON for EndPoint information read
    final yesNoModel = YesNoModel.fromJson(response.data);

    //Please always use or review
    //https://app.quicktype.io/
    //and VSCode extrension Paste JSON as Code

    // Message newMessage = Message(
    //     text: response.data['answer'],
    //     fromWho: FromWho.hers,
    //     imageUrl: response.data['image'],
    //     created: DateTime.now());

    Message newMessage = Message(
        text: yesNoModel.answer,
        fromWho: FromWho.hers,
        imageUrl: yesNoModel.image,
        created: DateTime.now());

    return newMessage;
  }
}
