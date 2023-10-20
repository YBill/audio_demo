import 'package:audio_service/audio_service.dart';

import 'audio_player_handler.dart';

class Player {
  Player._internal();

  static final Player _singleton = Player._internal();

  static Player get instance => _singleton;

  late AudioPlayerHandler _audioHandler;

  audioHandler() => _audioHandler;

  Future<void> init() async {
    await _initPlayer();
  }

  Future<void> _initPlayer() async {
    _audioHandler = await AudioService.init(
      builder: () => AudioPlayerHandlerImpl(),
      config: const AudioServiceConfig(
          androidNotificationChannelId: 'channel_summary_reading',
          androidNotificationChannelName: 'Summary playback',
          androidNotificationOngoing: true,
          androidNotificationIcon: 'drawable/ic_notification'),
    );
  }
}
