import '../models/auth_model.dart';

class AuthService{
static List<AuthModel> users = [
  AuthModel(Email: 'bilal.bil.anas@gmail.com', Password: '123Ab123?', Name: 'bilal', Phone_No: '0963459654'),
  AuthModel(Email: 'bilal.kanber@gmail.com', Password: '456456', Name: 'bilalkanber', Phone_No: '0964582545'),
];

static login (String email,String password){
  try {
    return users.firstWhere((user) => user.Email == email && user.Password == password);
  } catch (e) {
    return null;
  }
}

static register(String email, String password, String name ,String phone   ) {

  bool emailExists = users.any((user) => user.Email == email);
  if (emailExists) {
    return "البريد الإلكتروني مستخدم مسبقًا";
  }
  AuthModel newUser = AuthModel(Email: email, Password: password, Name: name, Phone_No: phone);
  users.add(newUser);
  return "تم إنشاء الحساب بنجاح";
}

}