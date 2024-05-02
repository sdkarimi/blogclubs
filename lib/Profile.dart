import 'package:blogclubs/Home.dart';
import 'package:blogclubs/data.dart';
import 'package:blogclubs/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    final posts=AppDatabase.posts;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themedata.colorScheme.background.withOpacity(0),
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz_rounded),
            onPressed: () {},
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(32, 0, 32, 64),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: themedata.colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: themedata.colorScheme.onBackground
                                .withOpacity(0.1))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Assets.img.stories.story3
                                  .image(width: 84, height: 84),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('@joviedan'),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Jovi Daniel',
                                    style: themedata.textTheme.bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text('UX Designer',
                                      style: themedata.textTheme.bodyLarge!.apply(
                                          color: themedata.colorScheme.primary)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                          child: Text(
                            "About me",
                            style: themedata.textTheme.titleLarge,
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 4, 32, 32),
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          style: themedata.textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.w200),
                        ),
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 32,
                    left: 96,
                    right: 96,
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 30,
                            color: themedata.colorScheme.onBackground
                                .withOpacity(0.8))
                      ]),
                    )),
                Positioned(
                  bottom: 32,
                  left: 64,
                  right: 64,
                  child: Container(
                    height: 68,
                    decoration: BoxDecoration(
                        color: themedata.colorScheme.primary,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff2151CD),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "52",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: themedata.colorScheme.onPrimary),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Post',
                                  style: themedata.textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w300,
                                      color: themedata.colorScheme.onPrimary),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "250",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: themedata.colorScheme.onPrimary),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Following',
                                style: themedata.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: themedata.colorScheme.onPrimary),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "4.5K",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: themedata.colorScheme.onPrimary),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Followers',
                                style: themedata.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: themedata.colorScheme.onPrimary),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: themedata.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
        
                      children: [
                        Expanded(
                          child: Text(
                            "My Posts",
                            style: themedata.textTheme.titleLarge,
                          ),
                        ),
                        IconButton(
                            onPressed: () {}, icon: Assets.img.icons.grid.svg()),
                        IconButton(
                            onPressed: () {}, icon: Assets.img.icons.table.svg()),
                      ],
                    ),
                  ),
                  for (var i=0 ; i<posts.length;i++) Post(post: posts[i])
        
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
