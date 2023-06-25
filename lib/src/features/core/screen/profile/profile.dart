import 'package:ecommerce_flutter/src/common_widgets/divider/divider.dart';
import 'package:ecommerce_flutter/src/features/core/screen/profile/widget/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../repository/authentication_repository/authentication_repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Stack(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/logo/logo_light.png'),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    child: Icon(IconlyLight.edit),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          const Text('Nguyễn Khải Hoàn',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 8),
          const Text('0388586955',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 30),
          ProfileMenuItem(text: "Cá nhân", icon: Icon(IconlyLight.profile)),
          ProfileMenuItem(text: "Ví", icon: Icon(IconlyLight.wallet)),
          ProfileMenuItem(
              text: "Thông báo", icon: Icon(IconlyLight.notification)),
          ProfileMenuItem(text: "Cài đặt", icon: Icon(IconlyLight.setting)),
          ProfileMenuItem(
              text: "Thông tin ứng dụng", icon: Icon(IconlyLight.info_circle)),
          ProfileMenuItem(
              text: "Đăng xuất",
              icon: Icon(
                IconlyLight.logout,
                color: Colors.grey,
              ),
              logOut: true,
              onPress: () {
                Get.defaultDialog(
                  title: "Đăng xuất",
                  titleStyle: const TextStyle(fontSize: 20),
                  content: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text("Bạn chắc chắn rằng muốn đăng xuất?"),
                  ),
                  confirm: Expanded(
                    child: ElevatedButton(
                      onPressed: () =>
                          AuthenticationRepository.instance.logout(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent.shade200,
                          side: BorderSide.none),
                      child: Text("Yes",
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                  ),
                  cancel: OutlinedButton(
                      onPressed: () => Get.back(),
                      child: Text(
                        "No",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )),
                );
              }),
        ],
      ),
    ));
  }
}
