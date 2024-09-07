class CodeResponse {
  final String code;

  CodeResponse({
    required this.code,
  });

  factory CodeResponse.fromJson(Map<String, dynamic> json) => CodeResponse(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}
