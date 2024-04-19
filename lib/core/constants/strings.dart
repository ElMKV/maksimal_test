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

  //registration

  static const String on = 'На';

  static const String error_email = 'Введите корректный e-mail';

  static const String error_password = 'Пароль не должен быть меньше 6 символов';

  static const String send_code_to_email = 'отправлена ссылка для подтверждения регистрации';

  static const String tooltips_for_create_account = 'Для создания аккаунта заполните данные';

  static const String confirm_password = 'Подтвердите пароль';

  static const String create = 'Создать';

  static const String user_agreements = 'Принимаю условия пользовательского соглашения и условия обработки персональных данных';

  static const String agreemets_for_advertising = 'Принимаю условия пользовательского соглашения и условия обработки персональных данных';





  //errors
  static const String error_title = "Ошибка";
  static const String auth_error = "Ошибка авторизации";
  static const String profile_error = "Ошибка получения профилей";


}


extension StringCasingExtension on String {
  String toCapitalized() => this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
}
