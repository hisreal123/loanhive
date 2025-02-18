class IntValidator {
  final int? value; // immutability
  final String? error;

  IntValidator(this.value, this.error);
}

class Checker {
// Regular expressions
  final regName = RegExp(r'^[a-zA-Z0-9_]+$');
  final regNum = RegExp(r'^[0-9]+$');
  final regEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

// checkers
  String? checkName(String? name) {
    if (name == null) return null;
    if (!regName.hasMatch(name)) return 'Please enter a valid Name.';
    if (name.isEmpty) return 'Please enter Name.';
    if (name.length < 3) return 'Name must be at least 3 characters.';
    return null;
  }

  String? checkEmail(String? email) {
    if (email == null) return null;
    if (!regEmail.hasMatch(email)) return 'Please enter a valid Email.';
    if (email.isEmpty) return 'Please enter Email.';
    return null;
  }

  IntValidator? checkNumber(String? num) {
    if (num == null) return IntValidator(null, 'Please enter a valid Number.');
    if (!regNum.hasMatch(num)) {
      return IntValidator(null, 'Please enter a valid Number.');
    }
    if (num.isEmpty) return IntValidator(null, 'Please enter Number.');
    return IntValidator(int.parse(num), null);
  }
}
