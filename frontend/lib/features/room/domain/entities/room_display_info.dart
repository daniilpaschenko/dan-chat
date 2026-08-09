import '../../../user/domain/entities/user_entity.dart';
import '../../../room/domain/entities/room_entity.dart' show RoomListItemEntity, RoomType;

// вычисляет заголовок чата, аватарку, собеседника в direct-чате и текстовый подзаголовок 
class RoomDisplayInfo {
  final String title;
  final String? avatarUrl;
  final String? subtitle;

  const RoomDisplayInfo({required this.title, required this.avatarUrl, required this.subtitle});

  // includeSubtitle — в списке чатов подзаголовок не нужен, поэтому по умолчанию выключен
  factory RoomDisplayInfo.from(RoomListItemEntity? room, String? currentUserId, {bool includeSubtitle = false}) {
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
  static PartialUserEntity? otherParticipant(RoomListItemEntity room, String? currentUserId) {
    if (room.participants.isEmpty) return null;
    if (currentUserId == null) return room.participants.first.user;

    final others = room.participants.where((p) => p.user.id != currentUserId);
    return others.isNotEmpty ? others.first.user : room.participants.first.user;
  }

  static String? _subtitle(RoomListItemEntity room, bool isGroup, PartialUserEntity? other) {
    if (isGroup) {
      final count = room.participants.length;
      return '$count ${_participantsWord(count)}';
    }

    if (other == null) return null;
    return presenceText(other.status, other.lastSeen);
  }

  // принимает "сырые" status/lastSeen
  static String presenceText(UserStatus? status, DateTime? lastSeen) {
    if (status == UserStatus.online) return 'в сети';
    if (lastSeen == null) return 'не в сети';
    return 'был(а) ${_formatLastSeen(lastSeen)}';
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
    final local = lastSeen.toLocal();
    final now = DateTime.now();
    final diff = now.difference(local);

    if (diff.inMinutes < 1) return 'только что';
    if (diff.inHours < 1) return '${diff.inMinutes} мин назад';

    final time =
        '${local.hour.toString().padLeft(2, '0')}:'
        '${local.minute.toString().padLeft(2, '0')}';

    final isToday =
        local.year == now.year &&
        local.month == now.month &&
        local.day == now.day;

    if (isToday) {
      return 'в $time';
    }

    final yesterday = now.subtract(const Duration(days: 1));

    final isYesterday =
        local.year == yesterday.year &&
        local.month == yesterday.month &&
        local.day == yesterday.day;

    if (isYesterday) {
      return 'вчера в $time';
    }

    // в этом году
    if (local.year == now.year) {
      const months = [
        'янв.',
        'февр.',
        'мар.',
        'апр.',
        'мая',
        'июн.',
        'июл.',
        'авг.',
        'сент.',
        'окт.',
        'нояб.',
        'дек.',
      ];

      return '${local.day} ${months[local.month - 1]} в $time';
    }

    // прошлый год и раньше
    final day = local.day.toString().padLeft(2, '0');
    final month = local.month.toString().padLeft(2, '0');

    return '$day.$month.${local.year} в $time';
  }
}