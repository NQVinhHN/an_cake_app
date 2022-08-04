class RegisterEvent {
  static bool isValidName(String name) => name.length > 4;
  static bool isValidPhone(String phone) => phone.length > 9;
  static bool isValidEmail(String email) =>
      email.length > 5 && email.contains('@');
  static bool isValidPass(String pass) => pass.length > 5;
}
