
class City{
  String _id = '0';
  String _name = '';

  City fromMap(Map<String, dynamic> map){
    _id = map['id'];
    _name = map['name'];
    return this;
  }

  Map<String, dynamic> toMap(Map<String, dynamic> map){
    return <String, dynamic>{
      'id': _id,
      'name': _name
    };
  }

}