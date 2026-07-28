import '../../data/models/room.dart';
import '../../../user/data/models/user_model.dart';

// вычисляет pаголовок чата, аватарку, собеседника в direct-чате и текстовый подзаголовок 
class RoomDisplayInfo {
  final String title;
  final String? avatarUrl;
  final String? subtitle;

  const RoomDisplayInfo({required this.title, required this.avatarUrl, required this.subtitle});

  // includeSubtitle — в списке чатов подзаголовок не нужен, поэтому по умолчанию выключен
  factory RoomDisplayInfo.from(RoomListItem? room, String? currentUserId, {bool includeSubtitle = false}) {
    if (room == null) {
      return const RoomDisplayInfo(title: 'Чат', avatarUrl: null, subtitle: null);
    }

    final isGroup = room.type == RoomType.group;
    final other = otherParticipant(room, currentUserId);

    final title = isGroup ? (room.name ?? 'Без названия') : (other?.username ?? 'Чат');
    final avatarUrl = isGroup ? room.avatarUrl : other?.avatarUrl;
    final subtitle = includeSubtitle ? _subtitle(room, isGroup, other) : null;

    return RoomDisplayInfo(title: title, avatarUrl: avatarUrl, subtitle: subtitle);
  }

  /// собеседник в direct-чате — единственный участник с id != currentUserId
  /// (откат на "первый участник", чтобы не упасть, если currentUserId неизвестен/не найден)
  static PartialUser? otherParticipant(RoomListItem room, String? currentUserId) {
    if (room.participants.isEmpty) return null;
    if (currentUserId == null) return room.participants.first.user;

    final others = room.participants.where((p) => p.user.id != currentUserId);
    return others.isNotEmpty ? others.first.user : room.participants.first.user;
  }

  static String? _subtitle(RoomListItem room, bool isGroup, PartialUser? other) {
    if (isGroup) {
      final count = room.participants.length;
      return '$count ${_participantsWord(count)}';
    }

    if (other == null) return null;
    if (other.status == UserStatus.online) return 'в сети';

    final lastSeen = other.lastSeen;
    if (lastSeen == null) return 'не в сети';
    return 'был(а) в ${_formatLastSeen(lastSeen)}';
  }

  // склонение слова "участник"
  static String _participantsWord(int count) {
    final mod10 = count % 10;
    final mod100 = count % 100;
    if (mod10 == 1 && mod100 != 11) return 'участник';
    if (mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)) return 'участника';
    return 'участников';
  }

  static String _formatLastSeen(DateTime lastSeen) {
    final now = DateTime.now();
    final diff = now.difference(lastSeen);
    if (diff.inMinutes < 1) return 'только что';
    if (diff.inHours < 1) return '${diff.inMinutes} мин назад';
    if (diff.inDays < 1) return '${diff.inHours} ч назад';
    return '${lastSeen.day.toString().padLeft(2, '0')}.${lastSeen.month.toString().padLeft(2, '0')}';
  }
}