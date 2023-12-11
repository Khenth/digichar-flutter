class MessageResponse {
    final String msg;

    MessageResponse({
        required this.msg,
    });

    factory MessageResponse.fromJson(Map<String, dynamic> json) => MessageResponse(
        msg: json["msg"],
    );
}
