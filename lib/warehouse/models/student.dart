// ignore_for_file: file_names

class Student{
  int? id;
  String? name;
  DateTime? date;
  int? age;
  bool? gender;
  String? address;

  Student({
     this.id ,
     this.name ,
     this.date,
     this.age,
     this.gender,
     this.address
  });

  factory Student.fromJson(Map<String,dynamic> json) => Student(
      id : json['id']?? -1,
      name: json['name']??"-",
      date: DateTime(
        int.tryParse(json['date'].toString().substring(0,4))??1900,//(19990102)
        int.tryParse(json['date'].toString().substring(4,6))??1,//    01234567
        int.tryParse(json['date'].toString().substring(6,8))??1
      ),
      age: json['age']??-1,
      gender: json['gender'] != null ? json['gender'] == 1 ? true : json['gender'] == 0 ? false : null : null,
      address: json['address']??"-"
  );

  Map<String,dynamic> toJson(){
    String year = date!.year.toString();
    int intMonth = date!.month;
    late String month;
    if(intMonth < 10){
        month = "0$intMonth";
    }else{
      month = intMonth.toString();
    }
    int intDate = date!.day;
    late String strDay;
    if(intDate < 10){
      strDay = "0$intDate";
    }else{
      strDay = intDate.toString();
    }
   
    var map = {
      "id" : id,
      "name":name,
      "date": "$year$month$strDay",
      "age":age,
      "gender": gender != null ?  gender! ? 1 : 0: -1,
      "address":address
    };
    return map;
  }
}