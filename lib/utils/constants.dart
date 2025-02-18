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
  final regPassword = RegExp(r'/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/');


  // passWord checker
  dynamic _passwordCheckerHelper(String? password) {
    if (password == null) return null;
    if (!regPassword.hasMatch(password)) {
      const List<String> passwordError = [
        'Password must have minimum 8 characters',
        'Password must have least One UpperCase needed',
        'Password must contain one lowercase',
        'Password must contain a special character'
      ];
      return passwordError;
    }
  }

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

  dynamic checkPassword(String? password) { _passwordCheckerHelper(password);}
  dynamic checkConfirmPassword(String? confirmPassword) { _passwordCheckerHelper(confirmPassword);}


  IntValidator? checkNumber(String? num) {
    if (num == null) return IntValidator(null, 'Please enter a valid Number.');
    if (!regNum.hasMatch(num)) {
      return IntValidator(null, 'Please enter a valid Number.');
    }
    if (num.isEmpty) return IntValidator(null, 'Please enter Number.');
    return IntValidator(int.parse(num), null);
  }
}
