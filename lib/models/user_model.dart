class User {
  late String token;
  late String role;
  late String username;

  static final String USER_ROLE_ADMIN    = 'admin';
  static final String USER_ROLE_CUSTOMER = 'customer';

  User(this.token, this.role, this.username);
}