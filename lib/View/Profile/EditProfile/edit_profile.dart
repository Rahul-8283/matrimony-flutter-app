import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Component/AppBar/header.dart';
import '../../../Component/Dashboard/image_card.dart';
import '../../../Component/EditProfileComponent/bottom_sheet_widget.dart';
import '../../../Component/EditProfileComponent/edit_profile_form.dart';
import '../../../Component/footer.dart';
import '../../../Controller/profile_controller.dart';

class EditProfile extends StatelessWidget {

  final ProfileController controller = Get.find<ProfileController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            height: 25.0.h,
                            width: 90.0.w,
                            child: ImageCard(
                              imageUrl:
                              'https://rn53themes.net/themes/matrimo/images/profiles/12.jpg',
                              borderRadius: BorderRadius.zero,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return BottomSheetWidget(
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                              );
                            },
                            icon: Icon(Icons.camera_alt, color: Colors.white),
                            label: Text('Update Profile Picture',
                                style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFE8C468),
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.0.h, horizontal: 10.0.w),
                              shape: RoundedRectangleBorder(),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return ShareProfileBottomSheet(
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                              );
                            },
                            icon: Icon(Icons.share, color: Colors.white),
                            label: Text('Share Profile',
                                style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.0.h, horizontal: 12.5.w),
                              shape: RoundedRectangleBorder(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 4.0.h),
              EditProfileForm(),
              SizedBox(height: 10.0.h),
              // Footer Section
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}