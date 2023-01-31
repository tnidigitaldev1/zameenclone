
class PropSubType{
  String _id = '0';
  String _name = '';
  String _typeId = '0';
  bool isSelected = false;

 String get id => _id;
  String get name => _name;
  String get typeId => _typeId;

  PropSubType fromMap(Map<String, dynamic> map){
    _id = map['id'];
    _name = map['name'];
    _typeId = map['type_id'];
    return this;
  }

  Map<String, dynamic> toMap(Map<String, dynamic> map){
    return <String, dynamic>{
      'id': _id,
      'name': _name,
      'type_id': _typeId
    };
  }

  @override
  String toString() {
    return _name;
  }
}