import '../models/user_model.dart';
import '../models/message_model.dart';

final List<User> mockUsers = [
  User(id: '1', name: 'Alice', email: '9TQ5m@example.com', profilePic: 'https://randomuser.me/api/portraits/women/1.jpg', lastSeen: DateTime.now().subtract(const Duration(hours: 3))),
  User(id: '2', name: 'Bob', email: 'l2d0w@example.com', profilePic: 'https://randomuser.me/api/portraits/men/1.jpg', lastSeen: DateTime.now().subtract(const Duration(hours: 2))),
  User(id: '3', name: 'Charlie', email: '2EY7l@example.com', profilePic: 'https://randomuser.me/api/portraits/women/2.jpg', lastSeen: DateTime.now().subtract(const Duration(hours: 1))),
  User(id: '4', name: 'Dave', email: 't0z2O@example.com', profilePic: 'https://randomuser.me/api/portraits/men/2.jpg', lastSeen: DateTime.now().subtract(const Duration(hours: 1))),
  User(id: '5', name: 'Eve', email: '7o0vI@example.com', profilePic: 'https://randomuser.me/api/portraits/women/3.jpg', lastSeen: DateTime.now().subtract(const Duration(hours: 1))),
];

final List<MessageModel> mockMessages = [
  MessageModel(id: 'm1', senderId: '1', receiverId: '2', content: 'Hey Bob, how are you?', timestamp: DateTime.now().subtract(const Duration(minutes: 15))),
  MessageModel(id: 'm2', senderId: '2', receiverId: '1', content: 'Hi Alice! I am good, thanks for asking.', timestamp: DateTime.now().subtract(const Duration(minutes: 10))),
  MessageModel(id: 'm3', senderId: '3', receiverId: '1', content: 'Hello Alice, are we still on for lunch tomorrow?', timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
  MessageModel(id: 'm4', senderId: '1', receiverId: '3', content: 'Yes Charlie, looking forward to it!', timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
];