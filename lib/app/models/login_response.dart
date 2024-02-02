import 'dart:convert';

class LoginResponse {
  bool? result;
  String? token;
  LoginResponse({
    this.result,
    this.token,
  });

  LoginResponse copyWith({
    bool? result,
    String? token,
  }) {
    return LoginResponse(
      result: result ?? this.result,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'result': result,
      'token': token,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      result: map['result'] != null ? map['result'] as bool : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginResponse(result: $result, token: $token)';

  @override
  bool operator ==(covariant LoginResponse other) {
    if (identical(this, other)) return true;

    return other.result == result && other.token == token;
  }

  @override
  int get hashCode => result.hashCode ^ token.hashCode;
}
