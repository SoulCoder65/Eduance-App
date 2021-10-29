class StudentData {
  late Data data;
  late String token;

   StudentData({required this.data, required this.token});

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
  String? email;
  String? fname;
  String? lname;
  String? username;
  String? sId;
  String? password;
  String? token;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.email,
        this.fname,
        this.lname,
        this.username,
        this.sId,
        this.password,
        this.token,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fname = json['fname'];
    lname = json['lname'];
    username = json['username'];
    sId = json['_id'];
    password = json['password'];
    token = json['token'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['username'] = this.username;
    data['_id'] = this.sId;
    data['password'] = this.password;
    data['token'] = this.token;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
