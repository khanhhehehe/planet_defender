bool isEmpty(var object) {
  if (object == false ||
      object == 'false' ||
      object == 'null' ||
      object == 'N/A' ||
      object == null ||
      object == {} ||
      object == '' ||
      object == []) {
    return true;
  }
  if (object is String && object.trim() == "") {
    return true;
  }
  if (object is Iterable && object.isEmpty) {
    return true;
  }
  return false;
}

abstract class StringValidator {
  bool isValid(String value);
}

class RegexValidator implements StringValidator {
  RegexValidator({required this.regexSource});
  final String regexSource;

  /// value: the input string
  /// returns: true if the input string is a full match for regexSource
  @override
  bool isValid(String value) {
    try {
      final regex = RegExp(regexSource);
      final matches = regex.allMatches(value);
      for (Match match in matches) {
        if (match.start == 0 && match.end == value.length) {
          return true;
        }
      }
      return false;
    } catch (e) {
      // Invalid regex
      assert(false, e.toString());
      return true;
    }
  }
}

bool appValidatePassword(String pass) {
  String p =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!#%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  RegExp regExp = RegExp(p);
  return regExp.hasMatch(pass);
}

bool appValidateEmail(String email) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(email);
}

bool? validateEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool validatePhoneNumber(String phoneNumber) {
  return RegExp(r"^([+])?[0-9]{8,15}$").hasMatch(phoneNumber);
}
