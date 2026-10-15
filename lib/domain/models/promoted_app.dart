import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Represents a sister Hadith or Islamic app promoted within the app.
class PromotedApp {
  final String id;
  final String titleEnglish;
  final String titleUrdu;
  final String titleArabic;
  final String descriptionEnglish;
  final String descriptionUrdu;
  final String packageName;
  final String? customUrl;
  final String? assetIconPath;
  final IconData iconData;
  final Color badgeColor;
  final bool isPublished;
  final String? rating;

  const PromotedApp({
    required this.id,
    required this.titleEnglish,
    required this.titleUrdu,
    required this.titleArabic,
    required this.descriptionEnglish,
    required this.descriptionUrdu,
    required this.packageName,
    this.assetIconPath,
    this.customUrl,
    this.iconData = Icons.menu_book_rounded,
    this.badgeColor = const Color(0xFF0A7E47),
    this.isPublished = true,
    this.rating,
  });

  /// Deep links directly to Google Play Store app with browser fallback.
  Future<bool> launchPlayStore() async {
    final marketUri = Uri.parse('market://details?id=$packageName');
    final webUri = customUrl != null
        ? Uri.parse(customUrl!)
        : Uri.parse('https://play.google.com/store/apps/details?id=$packageName');

    try {
      final launched = await launchUrl(
        marketUri,
        mode: LaunchMode.externalApplication,
      );
      if (launched) return true;
    } catch (_) {}

    try {
      return await launchUrl(
        webUri,
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      return false;
    }
  }
}
