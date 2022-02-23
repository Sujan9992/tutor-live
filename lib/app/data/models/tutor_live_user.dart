import 'person.dart';
import 'study_level.dart';

import '../../../core/utils/enum_converter.dart';

class TutorLiveUser extends Person {
  String? uid;
  String? avatarUrl;
  String? schoolName;
  String? major;
  String? educationLevel = "";
  List<String>? subjects = [];
  String? bio;
  List<StudyLevel>? degrees = [];
  List<String>? topics = [];
  TutorLiveUser(
      this.uid,
      String name,
      DateTime birthDay,
      Gender gender,
      String address,
      String phone,
      String mail,
      this.avatarUrl,
      this.schoolName,
      this.major,
      this.educationLevel,
      this.bio,
      [this.subjects,
      this.degrees])
      : super(name, birthDay, gender, address, phone, mail);

  TutorLiveUser.fromJson(this.uid, Map<String, dynamic> data)
      : super(
            data['name'],
            DateTime.parse(data['birthDay'].toDate().toString()),
            EnumConverter.stringToGender(data['gender']),
            data['address'],
            data['phone'],
            data['mail']) {
    avatarUrl = data['avatarUrl'];
    schoolName = data['schoolName'];
    major = data['major'];
    educationLevel = data['educationLevel'];
    bio = data['bio'];
    topics = List.from(data['topics']);
  }
  TutorLiveUser.cloneWith(TutorLiveUser tutorLiveUser)
      : super(
          tutorLiveUser.name,
          tutorLiveUser.birthDay,
          tutorLiveUser.gender,
          tutorLiveUser.address,
          tutorLiveUser.phone,
          tutorLiveUser.mail,
        ) {
    avatarUrl = tutorLiveUser.avatarUrl;
    schoolName = tutorLiveUser.schoolName;
    major = tutorLiveUser.major;
    educationLevel = tutorLiveUser.educationLevel;
    bio = tutorLiveUser.bio;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'birthDay': birthDay,
      'gender': EnumConverter.genderToString(gender),
      'address': address,
      'phone': phone,
      'mail': mail,
      'avatarUrl': avatarUrl,
      'schoolName': schoolName,
      'major': major,
      'educationLevel': educationLevel,
      'bio': bio,
      'indexList': getIndexList(),
      'topics': topics,
    };
  }

  bool isInfoUpdated() {
    return (name.isNotEmpty &&
        name != 'default_name' &&
        (phone.isNotEmpty) &&
        (mail.isNotEmpty) &&
        (bio != null && bio!.isNotEmpty) &&
        (educationLevel!.isNotEmpty));
  }

  List<String> getIndexList() {
    List<String> result = [];
    List<String> words = name.split(' ').toList();
    for (var word in words) {
      for (var i = 0; i < word.length + 1; i++) {
        result.add(word.substring(0, i).toLowerCase());
      }
    }
    return result;
  }
}
