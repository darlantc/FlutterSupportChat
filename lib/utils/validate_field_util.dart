import 'package:validate/validate.dart';

class ValidateFieldUtil {
  static String validateUserName(String value) {
    if (value.isEmpty) {
      return "Informe seu nome.";
    } else if (value.length < 3) {
      return "Informe um nome com mais de 2 caracteres.";
    }

    return null;
  }

  static String validateEmail(String value) {
    try {
      Validate.isEmail(value.trim());
    } catch (e) {
      return 'O e-mail informado é inválido!';
    }
    return null;
  }

  static String validatePassword(String value) {
    if (value.length < 5) {
      return 'A senha precisa ter pelo menos 5 caracteres';
    }
    return null;
  }
}
