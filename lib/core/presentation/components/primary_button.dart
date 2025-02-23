import 'package:flutter/material.dart';
import 'package:simubank/core/presentation/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final bool enabled;
  final String title;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  const PrimaryButton({
    super.key,
    this.enabled = true,
    required this.title,
    this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: !enabled
            ? AppColors.disabledButton
            : backgroundColor ?? AppColors.primary,
        fixedSize: Size.fromHeight(56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: enabled ? onPressed : null,
      child: Text(
        title,
        style: textTheme.headlineSmall?.copyWith(
          color: colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
