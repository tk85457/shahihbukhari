import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HadithBookItem {
  final String title;
  final String subtitle;
  final String packageName;
  final IconData icon;

  const HadithBookItem({
    required this.title,
    required this.subtitle,
    required this.packageName,
    required this.icon,
  });
}

class HadithCrossPromoWidget extends StatelessWidget {
  final String currentPackageName;

  const HadithCrossPromoWidget({
    super.key,
    required this.currentPackageName,
  });

  static const List<HadithBookItem> _allHadithBooks = [
    HadithBookItem(
      title: 'Sahih Bukhari',
      subtitle: 'Complete 7,563 Hadiths • Offline',
      packageName: 'com.albukhari.hadith',
      icon: Icons.menu_book_rounded,
    ),
    HadithBookItem(
      title: 'Sahih Muslim',
      subtitle: 'Complete 54 Books • Urdu & English',
      packageName: 'app.shahihmuslim',
      icon: Icons.auto_stories_rounded,
    ),
    HadithBookItem(
      title: 'Jami at-Tirmidhi',
      subtitle: 'Authentic Ethics & Fiqh Hadiths',
      packageName: 'com.jami.at_tirmidhi',
      icon: Icons.import_contacts_rounded,
    ),
    HadithBookItem(
      title: 'Sunan Abu Dawood',
      subtitle: 'Comprehensive Jurisprudence Hadiths',
      packageName: 'com.sunan.abudawood',
      icon: Icons.book_rounded,
    ),
    HadithBookItem(
      title: 'Sunan Ibn Majah',
      subtitle: 'Essential Sunnah Collection',
      packageName: 'com.sunan.ibnmajah',
      icon: Icons.collections_bookmark_rounded,
    ),
    HadithBookItem(
      title: 'Sunan An-Nasai',
      subtitle: 'Multilingual 3 Languages Edition',
      packageName: 'com.sunan.an_nasai',
      icon: Icons.library_books_rounded,
    ),
  ];

  Future<void> _openPlayStore(String packageName) async {
    final Uri url = Uri.parse("market://details?id=$packageName");
    final Uri webUrl = Uri.parse("https://play.google.com/store/apps/details?id=$packageName");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else if (await canLaunchUrl(webUrl)) {
      await launchUrl(webUrl, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final otherBooks = _allHadithBooks
        .where((book) => book.packageName != currentPackageName)
        .toList();

    return Card(
      margin: const EdgeInsets.all(12.0),
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: const Color(0xFF0A7E47).withAlpha(13),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.stars_rounded, color: Color(0xFF0A7E47)),
                SizedBox(width: 8),
                Text(
                  'Kutub Al-Sittah Hadith Collection',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A7E47),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'Explore other authentic Hadith books by Taha imam',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: otherBooks.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final book = otherBooks[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFF0A7E47).withAlpha(38),
                    child: Icon(book.icon, color: const Color(0xFF0A7E47), size: 20),
                  ),
                  title: Text(
                    book.title,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  subtitle: Text(
                    book.subtitle,
                    style: const TextStyle(fontSize: 11),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () => _openPlayStore(book.packageName),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A7E47),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('GET', style: TextStyle(fontSize: 12)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
