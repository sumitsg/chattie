import 'package:chattie/common/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ChatUsers extends Equatable {
  final String id;
  final String photoUrl;
  final String displayName;
  final String phoneNumber;
  final String aboutMe;

  const ChatUsers(
      {required this.id,
      required this.photoUrl,
      required this.displayName,
      required this.phoneNumber,
      required this.aboutMe});

  ChatUsers copyWith({
    String? id,
    String? photoUrl,
    String? displayName,
    String? phoneNumber,
    String? aboutMe,
  }) {
    return ChatUsers(
        id: id ?? this.id,
        photoUrl: photoUrl ?? this.photoUrl,
        displayName: displayName ?? this.displayName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        aboutMe: aboutMe ?? this.aboutMe);
  }

  Map<String, dynamic> toJson() => {
        FirestoreConstants.displayName: displayName,
        FirestoreConstants.photoUrl: photoUrl,
        FirestoreConstants.phoneNumber: phoneNumber,
        FirestoreConstants.aboutMe: aboutMe,
      };

  factory ChatUsers.fromDocument(DocumentSnapshot snapshot) {
    String photoUrl = "";
    String nickname = "";
    String phoneNumber = "";
    String aboutMe = "";

    try {
      photoUrl = snapshot.get(FirestoreConstants.photoUrl);
      nickname = snapshot.get(FirestoreConstants.displayName);
      phoneNumber = snapshot.get(FirestoreConstants.phoneNumber);
      aboutMe = snapshot.get(FirestoreConstants.aboutMe);
    } catch (e) {
      print(e);
    }

    return ChatUsers(
        id: snapshot.id,
        photoUrl: photoUrl,
        displayName: nickname,
        phoneNumber: phoneNumber,
        aboutMe: aboutMe);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, photoUrl, displayName, phoneNumber, aboutMe];
}
