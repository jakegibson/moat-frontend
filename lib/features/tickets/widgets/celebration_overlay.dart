import 'dart:math';
import 'package:flutter/material.dart';

/// A celebratory confetti animation overlay.
///
/// Use this to celebrate task completion or other achievements.
class CelebrationOverlay extends StatefulWidget {
  final Widget child;
  final bool celebrate;
  final Duration duration;
  final VoidCallback? onComplete;

  const CelebrationOverlay({
    required this.child,
    this.celebrate = false,
    this.duration = const Duration(milliseconds: 2000),
    this.onComplete,
    super.key,
  });

  @override
  State<CelebrationOverlay> createState() => _CelebrationOverlayState();
}

class _CelebrationOverlayState extends State<CelebrationOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_ConfettiPiece> _confetti;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _confetti = [];
    _controller.addStatusListener(_onAnimationStatus);
  }

  @override
  void didUpdateWidget(CelebrationOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.celebrate && !oldWidget.celebrate) {
      _startCelebration();
    }
  }

  void _onAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.onComplete?.call();
      setState(() => _confetti = []);
    }
  }

  void _startCelebration() {
    _confetti = List.generate(50, (_) => _ConfettiPiece(_random));
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_confetti.isNotEmpty)
          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  return CustomPaint(
                    painter: _ConfettiPainter(
                      confetti: _confetti,
                      progress: _controller.value,
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}

class _ConfettiPiece {
  final double startX;
  final double startY;
  final double velocityX;
  final double velocityY;
  final Color color;
  final double size;
  final double rotationSpeed;
  double rotation = 0;

  _ConfettiPiece(Random random)
      : startX = random.nextDouble(),
        startY = -0.1,
        velocityX = (random.nextDouble() - 0.5) * 0.3,
        velocityY = 0.5 + random.nextDouble() * 0.5,
        color = _confettiColors[random.nextInt(_confettiColors.length)],
        size = 6 + random.nextDouble() * 6,
        rotationSpeed = (random.nextDouble() - 0.5) * 10;

  static const _confettiColors = [
    Color(0xFFFF6B6B),
    Color(0xFF4ECDC4),
    Color(0xFFFFE66D),
    Color(0xFF95E1D3),
    Color(0xFFF38181),
    Color(0xFFAA96DA),
    Color(0xFFFCBF49),
    Color(0xFF2EC4B6),
  ];
}

class _ConfettiPainter extends CustomPainter {
  final List<_ConfettiPiece> confetti;
  final double progress;

  _ConfettiPainter({
    required this.confetti,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final piece in confetti) {
      final x = (piece.startX + piece.velocityX * progress) * size.width;
      final y = (piece.startY + piece.velocityY * progress) * size.height;

      if (y > size.height) continue;

      final opacity = 1.0 - (progress * 0.5).clamp(0.0, 1.0);

      final paint = Paint()
        ..color = piece.color.withValues(alpha: opacity)
        ..style = PaintingStyle.fill;

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(piece.rotationSpeed * progress);
      canvas.drawRect(
        Rect.fromCenter(
          center: Offset.zero,
          width: piece.size,
          height: piece.size * 0.6,
        ),
        paint,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter oldDelegate) => true;
}

/// Show a celebration effect
void showCelebration(BuildContext context) {
  final overlay = Overlay.of(context);
  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (context) => CelebrationOverlay(
      celebrate: true,
      onComplete: () => entry.remove(),
      child: const SizedBox.shrink(),
    ),
  );

  overlay.insert(entry);
}
