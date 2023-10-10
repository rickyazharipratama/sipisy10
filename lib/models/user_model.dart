class UserModel{
  int? id;
  String? username;
  DateTime? valid;


  UserModel({
    this.id,
    this.username,
    this.valid
  });

  factory UserModel.fromJson(Map<String,dynamic> json)=>UserModel(
    id: json['id'],
    username: json['username'],
    valid: DateTime.tryParse(json['valid'])
  );

  Map<String,dynamic> toJson(){
    return{
      "id" : id,
      "username": username,
      "valid": valid!.toIso8601String()
    };
  }  
}