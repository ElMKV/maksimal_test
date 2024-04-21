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

  static const String user_detail_title = 'Информация о';

  static const String search_user = 'Поиск пользователей';

  static const String prees_button_to_search = 'Для поиска нажмите ввод';

  static const String el_mkv = 'ELMKV';


  //errors
  static const String error_title = "Ошибка";

  static const String auth_error = "Ошибка авторизации";

  static const String profile_error = "Ошибка получения профилей";

  static const String empty_value = "Поле не может быть пустое";



}


extension StringCasingExtension on String {
  String toCapitalized() => this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
}
