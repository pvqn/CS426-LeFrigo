import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/routes/routes.dart';
import 'post_grid_view.dart';
import 'model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 40),
          ProfileHeader(),
          SizedBox(height: 30),
          UserStatistics(),
          SizedBox(height: 10),
          Divider(
            height: 8,
            thickness: 2,
            indent: 20,
            endIndent: 20,
            color: Colors.grey,
          ),
          SizedBox(height: 15),
          Text(
            'Posts',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF173F4E),
            ),
          ),
          SizedBox(height: 5),
          Expanded(child: PostGridPage()),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 20),
        const CircleAvatar(
          radius: 45,
          backgroundImage: AssetImage('assets/images/welcome_bg.png'),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'antihcmus',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Vietnam',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        const EditProfileButton(),
        const SizedBox(
          width: 15,
        )
      ],
    );
  }
}

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          context.router.push(const UpdateProfileRoute());
        },
        child: const Icon(
          Icons.edit,
          color: Colors.black,
          size: 25,
        ),
      ),
    );
  }
}

class UserStatistics extends StatelessWidget {
  const UserStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 5,
        ),
        UserStat(label: 'Post', value: '1'),
        UserStat(label: 'Likes', value: '10'),
        UserStat(label: 'Join From', value: 'August 2023'),
        SizedBox(
          width: 5,
        )
      ],
    );
  }
}

class UserStat extends StatelessWidget {
  final String label;
  final String value;

  const UserStat({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}

class PostGridPage extends StatefulWidget {
  const PostGridPage({super.key});

  @override
  PostGridPageState createState() => PostGridPageState();
}

class PostGridPageState extends State<PostGridPage> {
  List<dummy> items = [
    dummy(),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PostGridView(
        items: items,
        onRemove: (int index) {
          setState(() {
            items.removeAt(index);
          });
        },
      ),
    );
  }
}
