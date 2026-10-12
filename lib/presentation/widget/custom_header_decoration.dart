part of widget;

enum HeaderDecorationStyle { login, header, appBar, bar }

/// Hoạ tiết trang trí (gợn nước, giọt nước, lưới chấm, sóng) vẽ trên nền
/// màu phẳng của header đăng nhập, header trang chủ và thanh tab.
class CustomHeaderDecoration extends StatelessWidget {
  final HeaderDecorationStyle style;

  const CustomHeaderDecoration({
    super.key,
    this.style = HeaderDecorationStyle.header,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ClipRect(
        child: CustomPaint(
          size: Size.infinite,
          painter: _HeaderDecorationPainter(style),
        ),
      ),
    );
  }
}

class _HeaderDecorationPainter extends CustomPainter {
  final HeaderDecorationStyle style;

  _HeaderDecorationPainter(this.style);

  static final Path _drop =
      Path()
        ..moveTo(0, -12)
        ..cubicTo(6, -4, 9, 1, 9, 5)
        ..arcToPoint(const Offset(-9, 5), radius: const Radius.circular(9))
        ..cubicTo(-9, 1, -6, -4, 0, -12)
        ..close();

  Paint _fill(double alpha) =>
      Paint()..color = Colors.white.withValues(alpha: alpha);

  Paint _stroke(double alpha, double width) =>
      Paint()
        ..color = Colors.white.withValues(alpha: alpha)
        ..style = PaintingStyle.stroke
        ..strokeWidth = width
        ..strokeCap = StrokeCap.round;

  void _ripples(
    Canvas canvas,
    Offset center,
    double radius,
    double step,
    int count,
  ) {
    canvas.drawCircle(center, radius, _fill(0.06));
    final paint = _stroke(0.13, 1.5);
    for (int i = 0; i < count; i++) {
      canvas.drawCircle(center, radius + step * i, paint);
    }
  }

  void _dots(Canvas canvas, Rect rect) {
    final paint = _fill(0.24);
    for (double y = rect.top; y <= rect.bottom; y += 14) {
      for (double x = rect.left; x <= rect.right; x += 14) {
        canvas.drawCircle(Offset(x, y), 1.5, paint);
      }
    }
  }

  void _drawDrop(
    Canvas canvas,
    Offset offset, {
    required double scale,
    required double alpha,
    double degree = 0,
    double? strokeWidth,
  }) {
    canvas.save();
    canvas.translate(offset.dx, offset.dy);
    canvas.rotate(degree * pi / 180);
    canvas.scale(scale);
    canvas.drawPath(
      _drop,
      strokeWidth == null ? _fill(alpha) : _stroke(alpha, strokeWidth / scale),
    );
    canvas.restore();
  }

  void _waves(Canvas canvas, double w, double y, double bottom) {
    final first =
        Path()
          ..moveTo(0, y)
          ..cubicTo(w * 0.154, y - 26, w * 0.32, y + 26, w * 0.5, y)
          ..cubicTo(w * 0.68, y - 26, w * 0.846, y - 26, w, y)
          ..lineTo(w, bottom)
          ..lineTo(0, bottom)
          ..close();
    final y2 = y + 20;
    final second =
        Path()
          ..moveTo(0, y2)
          ..cubicTo(w * 0.18, y2 - 24, w * 0.36, y2 + 22, w * 0.55, y2 - 2)
          ..cubicTo(w * 0.74, y2 - 26, w * 0.86, y2 - 20, w, y2 + 2)
          ..lineTo(w, bottom)
          ..lineTo(0, bottom)
          ..close();
    canvas.drawPath(first, _fill(0.06));
    canvas.drawPath(second, _fill(0.07));
  }

  void _pipes(Canvas canvas, double w, double k) {
    const radius = Radius.circular(14);
    final left =
        Path()
          ..moveTo(-10, 262 * k)
          ..lineTo(52, 262 * k)
          ..arcToPoint(
            Offset(66, 262 * k - 14),
            radius: radius,
            clockwise: false,
          )
          ..lineTo(66, 200 * k + 14)
          ..arcToPoint(Offset(80, 200 * k), radius: radius)
          ..lineTo(112, 200 * k);
    final right =
        Path()
          ..moveTo(w + 10, 296 * k)
          ..lineTo(w - 48, 296 * k)
          ..arcToPoint(Offset(w - 62, 296 * k - 14), radius: radius)
          ..lineTo(w - 62, 258 * k);
    final paint = _stroke(0.2, 2);
    canvas.drawPath(left, paint);
    canvas.drawPath(right, paint);
    canvas.drawCircle(Offset(112, 200 * k), 4.5, _fill(0.45));
    canvas.drawCircle(Offset(w - 62, 258 * k), 4.5, _fill(0.45));
  }

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    switch (style) {
      case HeaderDecorationStyle.login:
        // Phần header chiếm 40% chiều cao; toạ độ gốc tính trên header 338.
        final hero = h * 0.4;
        final k = hero / 338;
        _ripples(canvas, Offset(w * 0.885, 36), 62, 42, 5);
        _dots(canvas, Rect.fromLTWH(22, 64 * k, 84, 84));
        _pipes(canvas, w, k);
        _drawDrop(canvas, Offset(w * 0.133, 196 * k), scale: 1.5, alpha: 0.12);
        _drawDrop(
          canvas,
          Offset(w * 0.826, 172 * k),
          scale: 2.3,
          alpha: 0.24,
          degree: 14,
          strokeWidth: 1.8,
        );
        _drawDrop(
          canvas,
          Offset(w * 0.723, 92 * k),
          scale: 0.9,
          alpha: 0.2,
          degree: -10,
        );
        _drawDrop(
          canvas,
          Offset(w * 0.338, 56 * k),
          scale: 0.7,
          alpha: 0.26,
          degree: 8,
          strokeWidth: 1.2,
        );
        _waves(canvas, w, hero - 42 * k, hero + 40);
        break;
      case HeaderDecorationStyle.header:
        _ripples(canvas, Offset(w * 0.9, 26), 40, 32, 4);
        _dots(canvas, Rect.fromLTWH(w * 0.55, 58, 56, 42));
        _drawDrop(
          canvas,
          Offset(w * 0.78, 76),
          scale: 1.5,
          alpha: 0.26,
          degree: 12,
          strokeWidth: 1.6,
        );
        _drawDrop(
          canvas,
          Offset(w * 0.687, 36),
          scale: 0.75,
          alpha: 0.2,
          degree: -8,
        );
        _waves(canvas, w, h - 54, h);
        break;
      case HeaderDecorationStyle.appBar:
        _ripples(canvas, Offset(w * 0.9, h * 0.25), 34, 26, 4);
        _drawDrop(
          canvas,
          Offset(w * 0.22, h * 0.62),
          scale: 1.0,
          alpha: 0.2,
          degree: 10,
          strokeWidth: 1.4,
        );
        _drawDrop(
          canvas,
          Offset(w * 0.68, h * 0.42),
          scale: 0.7,
          alpha: 0.16,
          degree: -8,
        );
        break;
      case HeaderDecorationStyle.bar:
        _ripples(canvas, Offset(w * 0.9, 0), 26, 22, 4);
        _dots(canvas, Rect.fromLTWH(16, 10, 56, 28));
        _drawDrop(
          canvas,
          Offset(w * 0.3, h * 0.45),
          scale: 1.0,
          alpha: 0.22,
          degree: 10,
          strokeWidth: 1.4,
        );
        _drawDrop(
          canvas,
          Offset(w * 0.62, h * 0.3),
          scale: 0.7,
          alpha: 0.18,
          degree: -8,
        );
        break;
    }
  }

  @override
  bool shouldRepaint(_HeaderDecorationPainter oldDelegate) =>
      oldDelegate.style != style;
}
