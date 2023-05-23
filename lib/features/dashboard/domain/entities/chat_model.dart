class ChatModel {
  final String? profileURL;
  final String? name;
  final String? lastMessage;
  final DateTime? messageTime;
  final int? unreadCount;
  final bool? isOnline;

  ChatModel(
      {this.profileURL,
      this.lastMessage,
      this.name,
      this.messageTime,
      this.isOnline,
      this.unreadCount});
}
