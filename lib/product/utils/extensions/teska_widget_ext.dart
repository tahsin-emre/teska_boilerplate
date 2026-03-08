import 'package:flutter/material.dart';

extension TeskaWidgetExt on Widget {
  _TeskaWidgetExt get teska => _TeskaWidgetExt(this);
}

final class _TeskaWidgetExt {
  const _TeskaWidgetExt(this.value);
  final Widget value;

  Widget get center => Center(child: value);
  Widget get expanded => Expanded(child: value);
  Widget get flexible => Flexible(child: value);
  Widget get sliverAdapter => SliverToBoxAdapter(child: value);

  Widget toDisable({bool isDisabled = true, double disabledOpacity = 0.25}) {
    return IgnorePointer(
      ignoring: isDisabled,
      child: Opacity(
        opacity: isDisabled ? disabledOpacity : 1.0,
        child: value,
      ),
    );
  }
}
