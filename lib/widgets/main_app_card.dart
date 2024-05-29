import 'package:flutter/material.dart';

class MainAppCard extends StatefulWidget {
  const MainAppCard({
    super.key,
    this.offset = Offset.zero,
    this.borderRadius,
    this.padding,
    this.size,
    this.backCardBorder,
    this.frontCardBorder,
    this.backCardColor,
    this.frontCardColor,
    required this.child,
  });

  final Size? size;
  final Border? backCardBorder, frontCardBorder;
  final Color? backCardColor, frontCardColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Widget child;
  final Offset offset;

  @override
  State<MainAppCard> createState() => _MainAppCardState();
}

class _MainAppCardState extends State<MainAppCard> {
  final _key = GlobalKey();

  double height = 0;
  double width = 0;

  void calculateWidgetHeight() {
    if (widget.size != null) {
      height = widget.size!.height;
      width = widget.size!.width;
      return;
    }
    final RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    height = size.height;
    width = size.width;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      calculateWidgetHeight();
    });
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MainAppCard oldWidget) {
    calculateWidgetHeight();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: height > 0 ? height : widget.size?.height,
              width: width > 0 ? width : widget.size?.width,
              margin: EdgeInsetsDirectional.only(start: widget.offset.dx, bottom: widget.offset.dy),
              decoration: BoxDecoration(
                color: widget.backCardColor ?? Colors.white.withOpacity(0.2),
                borderRadius: widget.borderRadius,
                border: widget.backCardBorder,
              ),
            ),
            NotificationListener<SizeChangedLayoutNotification>(
              onNotification: (notification) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  calculateWidgetHeight();
                });
                return true;
              },
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  end: widget.offset.dx,
                  top: widget.offset.dy,
                ),
                child: SizeChangedLayoutNotifier(
                  child: Container(
                    key: _key,
                    alignment: Alignment.center,
                    padding: widget.padding,
                    width: widget.size?.width,
                    height: widget.size?.height,
                    decoration: BoxDecoration(
                      color: widget.frontCardColor ?? Colors.white.withOpacity(0.8),
                      borderRadius: widget.borderRadius,
                      border: widget.frontCardBorder,
                    ),
                    child: widget.child,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
