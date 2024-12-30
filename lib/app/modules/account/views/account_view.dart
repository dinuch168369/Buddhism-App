import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Replace with your image
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Doris R. Hatfield",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "+1 281-582-8252",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "បុរសកើតឆ្នាំ២០២២",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Contact Section Title
            const Text(
              "គណនី",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            //  Items
            const ContactItem(
              icon: Icons.account_balance_wallet_outlined,
              text: "ប្ដូរព័ត៍មានផ្ទាល់ខ្លូន",
            ),
            ContactItem(
              icon: Icons.library_books_outlined,
              text: "ផ្ចាប់ជាមួយគណនី",
            ),
            ContactItem(
              icon: Icons.lock_outline,
              text: "ប្ដូរពាក្យសម្ងាត់",
            ),
            const SizedBox(height: 30),

            // Action Section Title
            const Text(
              "ការកំណត់",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Action Items
            const ActionItem(
              icon: Icons.edit_outlined,
              text: "បរិច្ចាកទាន",
            ),
            ActionItem(
              icon: Icons.info_outline,
              text: "ផ្ទៃបង្ហាញ",
            ),
            ActionItem(
              icon: Icons.help_outline,
              text: "លក្ខខណ្ឌ និង គោលការណ៍",
            ),
            ActionItem(
              icon: Icons.logout,
              text: "អំពីយើង",
            ),
          ],
        ),
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactItem({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
class ActionItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const ActionItem({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
