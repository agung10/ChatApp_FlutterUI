import 'package:chat/models/ChatMessage.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'audio_message.dart';
import 'text_message.dart';
import 'video_message.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case MessageType.text:
          return TextMessage(message: message);
          // ignore: dead_code
          break;
        case MessageType.audio:
          return AudioMessage(message: message);
          // ignore: dead_code
          break;
        case MessageType.video:
          return VideoMessage();
          // ignore: dead_code
          break;
        default:
          return SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage("assets/images/user_2.png"),
            ),
            SizedBox(width: kDefaultPadding / 2),
          ],
          messageContaint(message),
          if (message.isSender) MessageStatusDot(status: message.messageStatus)
        ],
      ),
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  final MessageStatus status;

  const MessageStatusDot({Key? key, required this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: unused_element
    Color dotColor(MessageStatus status) {
      switch (status) {
      case MessageStatus.not_sent:
        return kErrorColor;
        // ignore: dead_code
        break;
      case MessageStatus.not_view:
        return Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.1);
        // ignore: dead_code
        break;
      case MessageStatus.viewed:
        return kPrimaryColor;
        // ignore: dead_code
        break;
      default:
        return Colors.transparent;
      }
    }
    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding / 2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(status),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
