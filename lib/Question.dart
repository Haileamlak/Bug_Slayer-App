// ignore_for_file: curly_braces_in_flow_control_structures

class Question {
  int? _id;
  String _name = "User";
  String _job = "no Job";
  String _theQuest = "";
  String _phone = "no Phone";

  Question(this._name, this._job, this._theQuest, this._phone);
  
  Question.withId(this._id,this._name, this._job, this._theQuest, this._phone);


  String get name => _name;
  String get job => _job;
  String get theQuest => _theQuest;
  String get phone => _phone;
  set name(String nm) {
    if (nm.length < 30)
      _name = nm;
    else
      _name = "User";
  }

  set job(String jb) {
    if (jb.length < 30)
      _job = jb;
    else
      _job = "no Job";
  }

  set theQuest(String qt) {
    if (qt.length < 300) _theQuest = qt;
  }

  set phone(String pn) {
    if (pn.length == 13)
      _phone = pn;
    else
      _phone = "no Phone";
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    map['job'] = _job;
    map['theQuest'] = _theQuest;
    map['phone'] = _phone;

    return map;
  }

  Question.fromMap(Map<String, dynamic> quest) {
    _name = quest['name'];
    _job = quest['job'];
    _theQuest = quest['theQuest'];
    _phone = quest['phone'];
  }
}
