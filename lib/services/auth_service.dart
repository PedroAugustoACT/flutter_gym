class AuthService {
  static final Map<String, Map<String, dynamic>> users = {
    "pedro@gmail.com": {"name": "Pedro", "imc": 17.5}, // Abaixo do peso
    "marcelo@gmail.com": {"name": "Marcelo", "imc": 22.0}, // Peso ideal
    "yago@gmail.com": {"name": "Yago", "imc": 27.0}, // Sobrepeso
  };

  static Map<String, dynamic>? currentUser;

  static bool login(String email, String password) {
    if (users.containsKey(email) && password == "123") {
      currentUser = {"email": email, ...users[email]!};
      return true;
    }
    return false;
  }

  static void logout() {
    currentUser = null;
  }
}
