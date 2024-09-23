import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  late final String senderId;
  late final String senderEmail;
  late final String receiverId;
  late final String message;
  late final Timestamp timestamp;

  Message({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.timestamp,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'message': message,
      'timeStamp': timestamp,
    };
  }
}
