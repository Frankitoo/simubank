import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:simubank/generated/locale_keys.g.dart';
import 'package:simubank/core/presentation/theme/app_colors.dart';
import 'package:simubank/core/presentation/theme/text_themes.dart';

class ErrorSnackBar extends SnackBar {
  ErrorSnackBar({
    super.key,
    required BuildContext context,
    required String title,
  }) : super(
          duration: Duration(seconds: 4),
          backgroundColor: AppColors.error,
          padding: EdgeInsets.zero,
          content: SizedBox(
            height: 56,
            child: Row(
              children: [
                const Spacer(),
                Text(
                  title,
                  style: TextThemes.lightTextTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  child: Text(
                    LocaleKeys.ok.tr(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
                const SizedBox(width: 32),
              ],
            ),
          ),
        );
}
