import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerScreen extends StatefulWidget {
  final String url;

  const PlayerScreen({super.key, required this.url});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late final VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (!_isInitialized) return;
    if (_controller.value.isPlaying) {
      _controller.pause();
      setState(() => _isPlaying = false);
    } else {
      _controller.play();
      setState(() => _isPlaying = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Player'),
      ),
      body: Center(
        child: _isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    VideoPlayer(_controller),
                    _ControlsOverlay(
                      controller: _controller,
                      onToggle: _togglePlayPause,
                    ),
                    VideoProgressIndicator(
                      _controller,
                      allowScrubbing: true,
                      colors: VideoProgressColors(
                        playedColor: Theme.of(context).colorScheme.primary,
                        backgroundColor: Colors.white24,
                        bufferedColor: Colors.white38,
                      ),
                    ),
                  ],
                ),
              )
            : const CircularProgressIndicator(color: Colors.white),
      ),
      floatingActionButton: _isInitialized
          ? FloatingActionButton(
              onPressed: _togglePlayPause,
              backgroundColor: Colors.white,
              child: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.black,
              ),
            )
          : null,
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  final VideoPlayerController controller;
  final VoidCallback onToggle;

  const _ControlsOverlay({required this.controller, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            reverseDuration: const Duration(milliseconds: 150),
            child: controller.value.isPlaying
                ? const SizedBox.shrink()
                : Container(
                    color: Colors.black38,
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

Future<void> openPlayerScreen(BuildContext context, String url) async {
  await Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (_) => PlayerScreen(url: url)));
}
