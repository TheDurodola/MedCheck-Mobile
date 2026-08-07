class VerifySachetRequest {
  final String verificationCode;

  VerifySachetRequest(this.verificationCode);

  Map<String, dynamic> toJson() {
    return {
      "sachetVerificationCode": verificationCode,

    };
  }
}