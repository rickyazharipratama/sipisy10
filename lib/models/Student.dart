class Student{
  int id;
  String name;
  String date;
  int age;
  String gender;
  String address;

  Student({
    required this.id ,
    required this.name ,
    required this.date,
    required this.age,
    required this.gender,
    required this.address
  });

  factory Student.fromJson(Map<String,dynamic> json) => Student(
      id : json['id']?? -1,
      name: json['name']??"-",
      date: json['date']??"10100101",
      age: json['age']??-1,
      gender: json['gender']??"-",
      address: json['address']??"-"
  );

  Map<String,dynamic> toJson(){
    var map = {
      "id" : id,
      "name":name,
      "date": date,
      "age":age,
      "gender":gender,
      "address":address
    };
    return map;
  }
}