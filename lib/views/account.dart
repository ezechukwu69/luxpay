import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:luxpay/utils/hexcolor.dart';
import 'package:luxpay/utils/sizeConfig.dart';
import 'package:luxpay/views/accounts_subviews/settings.dart';
import 'package:luxpay/widgets/logout_popup.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileAction(title: "My Profile", icon: IconlyLight.profile),
            SizedBox(height: SizeConfig.blockSizeVertical! * 3),
            ProfileAction(
                title: "Transaction Details", icon: IconlyLight.chart),
            SizedBox(height: SizeConfig.blockSizeVertical! * 3),
            ProfileAction(
                title: "Address Management", icon: IconlyLight.location),
            SizedBox(height: SizeConfig.blockSizeVertical! * 3),
            ProfileAction(
                title: "Authentication", icon: IconlyLight.shieldDone),
            SizedBox(height: SizeConfig.blockSizeVertical! * 3),
            ProfileAction(title: "Help & Support", icon: Icons.help_outline),
            SizedBox(height: SizeConfig.blockSizeVertical! * 3),
            ProfileAction(title: "Contacts", icon: IconlyLight.user3),
            SizedBox(height: SizeConfig.blockSizeVertical! * 3),
            ProfileAction(
              title: "Settings",
              icon: IconlyLight.setting,
              onTap: () => Navigator.of(context).pushNamed(
                SettingsPage.path,
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 4),
            LogoutButton(onTap: () {
              showDialog(
                  context: context,
                  useRootNavigator: false,
                  barrierDismissible: false,
                  builder: (context) {
                    return Dialog(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.black,
                      alignment: Alignment.bottomCenter,
                      child: LogoutPopup(),
                    );
                  });
            }),
          ],
        ),
        padding: EdgeInsets.only(
          bottom: 20,
          left: 24,
          right: 24,
          top: SizeConfig.blockSizeVertical! * 4,
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  final VoidCallback onTap;
  const LogoutButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 47,
        width: double.infinity,
        decoration: BoxDecoration(
          color: HexColor("#D70A0A").withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "Log Out",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: HexColor("#D70A0A"),
          ),
        ),
      ),
    );
  }
}

class ProfileAction extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  const ProfileAction(
      {Key? key, required this.title, required this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 59,
        padding: EdgeInsets.symmetric(
          horizontal: 18,
        ),
        decoration: BoxDecoration(
          color: HexColor("#E8E8E8").withOpacity(0.35),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: HexColor("#343434"),
                  size: 30,
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: HexColor("#343434"),
                  ),
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: HexColor(
                "#CCCCCC",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
