// class StudentData {
//   late Data data;
//   late String token;
//
//    StudentData({required this.data, required this.token});
//
//    StudentData.fromJson(Map<String, dynamic> json) {
//     data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
//     token = json['token'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     data['token'] = this.token;
//     return data;
//   }
// }
//
// class Data {
//   String? email;
//   String? fname;
//   String? lname;
//   String? username;
//   String? sId;
//   String? password;
//   String? profileurl;
//   String? token;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//
//   Data(
//       {this.email,
//         this.fname,
//         this.lname,
//         this.username,
//         this.sId,
//         this.password,
//         this.profileurl,
//         this.token,
//         this.createdAt,
//         this.updatedAt,
//         this.iV});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     fname = json['fname'];
//     lname = json['lname'];
//     username = json['username'];
//     sId = json['_id'];
//     password = json['password'];
//     profileurl = json['profileurl'];
//     token = json['token'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['email'] = this.email;
//     data['fname'] = this.fname;
//     data['lname'] = this.lname;
//     data['username'] = this.username;
//     data['_id'] = this.sId;
//     data['password'] = this.password;
//     data['profileurl'] = this.profileurl;
//     data['token'] = this.token;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
class StudentData {
  late Data data;
  late String token;

  StudentData({required this.data,required this.token});

  StudentData.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  String? sId;
  String? email;
  String? fname;
  String? lname;
  String? phone;
  String? username;
  String? password;
  String? dob;
  String? gender;
  String? profileurl;
  String? token;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.email,
        this.fname,
        this.lname,
        this.phone,
        this.username,
        this.password,
        this.dob,
        this.gender,
        this.profileurl,
        this.token,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    fname = json['fname'];
    lname = json['lname'];
    phone = json['phone'];
    username = json['username'];
    password = json['password'];
    dob = json['dob'];
    gender = json['gender'];
    profileurl = json['profileurl'];
    token = json['token'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['phone'] = this.phone;
    data['username'] = this.username;
    data['password'] = this.password;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['profileurl'] = this.profileurl;
    data['token'] = this.token;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
