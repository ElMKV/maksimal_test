class S {
  static const String app_name = "";

  //login
  static const String enter = 'Войти';

  static const String auth = 'Авторизация';

  static const String toooltips = 'Для входа заполните данные';

  static const String registration = 'Зарегестрироваться';

  static const String hellow_title= "Добро пожаловать назад! \n" +
  "Войдите в свой аккаунт для дальнейшей работы";

  static const String login_edit_text = 'Почта';

  static const String password_edit_text = 'Пароль';

  //home

  static const String followers = 'Следит за';

  //home

  static const String user_detail_title = 'Информация о';






  //errors
  static const String error_title = "Ошибка";
  static const String auth_error = "Ошибка авторизации";
  static const String profile_error = "Ошибка получения профилей";


}


extension StringCasingExtension on String {
  String toCapitalized() => this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
}
