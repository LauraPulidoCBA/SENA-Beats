import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/track.dart';
import '../providers/music_provider.dart';

class TrackDetailScreen extends StatefulWidget {
  final Track track;
  const TrackDetailScreen({super.key, required this.track});

  @override
  State<TrackDetailScreen> createState() => _TrackDetailScreenState();
}

class _TrackDetailScreenState extends State<TrackDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10), // una vuelta cada 10s
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateRotation(bool isPlaying) {
    if (isPlaying) {
      _controller.repeat();
    } else {
      _controller.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final musicProvider = context.watch<MusicProvider>();
    final isPlaying = musicProvider.isPlaying;

    _updateRotation(isPlaying);

    return Scaffold(
      appBar: AppBar(title: Text(widget.track.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'avatar-${widget.track.id}',
              child: RotationTransition(
                turns: _controller,
                child: CircleAvatar(
                  radius: 150,
                  backgroundImage: NetworkImage(widget.track.image),
                  backgroundColor: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(widget.track.title,
                style: const TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold)),
            Text(widget.track.artist,
                style: const TextStyle(fontSize: 18, color: Colors.grey)),
            const SizedBox(height: 40),
            AnimatedScale(
              scale: isPlaying ? 1.2 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: IconButton(
                iconSize: 80,
                icon: Icon(isPlaying
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_filled),
                onPressed: () => musicProvider.playTrack(widget.track),
              ),
            )
          ],
        ),
      ),
    );
  }
}
