class VerifyPackRequest {
  final String verificationCode;

  VerifyPackRequest({required this.verificationCode});

  Map<String, dynamic> toJson() {
    return {
      "verificationCode": verificationCode,
    };
  }
}

