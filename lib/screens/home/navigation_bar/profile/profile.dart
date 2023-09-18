import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lefrigo/models/user.dart';
import 'package:lefrigo/providers/providers.dart';
import 'package:lefrigo/routes/routes.dart';
import 'package:lefrigo/services/get_it.dart';
import 'package:provider/provider.dart';
import 'post_grid_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  late User user;

  @override
  void didChangeDependencies() {
    final userProvider = Provider.of<UserProvider>(context);
    user = userProvider.user;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40),
          ProfileHeader(user: user),
          const SizedBox(height: 30),
          UserStatistics(user: user),
          const SizedBox(height: 10),
          const Divider(
            height: 8,
            thickness: 2,
            indent: 20,
            endIndent: 20,
            color: Colors.grey,
          ),
          const SizedBox(height: 15),
          const Text(
            'Posts',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF173F4E),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(child: PostGridPage(user: user)),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatefulWidget {
  final User user;

  const ProfileHeader({super.key, required this.user});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  ImageProvider<Object> _avatar =
      const AssetImage('assets/images/welcome_bg.png');

  @override
  void initState() {
    super.initState();
    if (widget.user.avatar != null) {
      _loadImage(widget.user.avatar!);
    }
  }

  Future<void> _loadImage(String imageId) async {
    final apiService = getIt.get<ApiService>();

    try {
      final image = await apiService.fetchImageFromId(id: imageId);

      if (image.type == ApiResponseType.success) {
        if (mounted) {
          setState(() {
          String rawData = image.message!;
          // To UInt8List
          List<int> bytes = rawData.codeUnits;
          // To Image
          _avatar = Image.memory(Uint8List.fromList(bytes)).image;
        });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 20),
        CircleAvatar(
          radius: 45,
          backgroundImage: _avatar,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user.username!,
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
                widget.user.country ?? 'Vietnam',
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
  final User user;

  const UserStatistics({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 5,
        ),
        UserStat(label: 'Post', value: '${user.posts.length}'),
        UserStat(label: 'Likes', value: '${user.likes.length}'),
        UserStat(
            label: 'Join From',
            value: DateFormat('MMMM yyyy').format(user.createdAt!)),
        const SizedBox(
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
  final User user;

  const PostGridPage({super.key, required this.user});

  @override
  PostGridPageState createState() => PostGridPageState();
}

class PostGridPageState extends State<PostGridPage> {
  late List<String> items;

  @override
  void didChangeDependencies() {
    final userProvider = Provider.of<UserProvider>(context);
    items = userProvider.user.posts;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PostGridView(
        items: items,
        onRemove: (int index) {
          setState(() {
            Provider.of<RecipeProvider>(context, listen: false)
                .deleteRecipe(recipeId: widget.user.posts[index])
                .then((value) {
              Provider.of<UserProvider>(context, listen: false).refreshUser();
            });

            items.removeAt(index);
          });
        },
      ),
    );
  }
}
