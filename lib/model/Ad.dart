
class Ad{
  String _id = '0';
  String _title = '';
  String _typeId = '0';
  String _subTypeId = '0';
  String _cityId = '0';
  String _locationId = '0';

  Ad fromMap(Map<String, dynamic> map){
    _id = map['id'];
    _title = map['title'];
    _typeId = map['type_id'];
    _subTypeId = map['sub_type_id'];
    _cityId = map['city_id'];
    _locationId = map['location_id'];
    return this;
  }

  Map<String, dynamic> toMap(Map<String, dynamic> map){
    return <String, dynamic>{
      'id': _id,
      'title': _title,
      'type_id': _typeId,
      'sub_type_id': _subTypeId,
      'city_id': _cityId,
      'location_id': _locationId
    };
  }

}