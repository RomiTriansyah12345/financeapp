import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridMenuItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;

  const GridMenuItem({super.key, required this.icon, required this.label, required this.color});

  @override
  State<GridMenuItem> createState() => _GridMenuItemState();
}

class _GridMenuItemState extends State<GridMenuItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 120));
    _scale = Tween<double>(begin: 1.0, end: 0.92).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _onTapDown(_) => _controller.forward();
  void _onTapUp(_) => _controller.reverse();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // smaller style like in reference
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scale,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(widget.icon, color: widget.color, size: 26),
            ),
            const SizedBox(height: 8),
            Text(widget.label, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
