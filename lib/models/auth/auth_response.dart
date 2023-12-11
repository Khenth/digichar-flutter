import 'package:digichar/models/auth/user.dart';

class AuthResponse {
    final String? message;
    final User user;
    final String token;
    final String refreshtoken;

    AuthResponse({
        required this.message,
        required this.user,
        required this.token,
        required this.refreshtoken,
    });

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        message: json["msg"],
        user: User.fromJson(json["user"]),
        token: json["token"],
        refreshtoken: json["refreshtoken"],
    );

}
