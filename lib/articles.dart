import 'package:blogclubs/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
            color: themeData.colorScheme.primary,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  color: themeData.colorScheme.primary.withOpacity(0.5))
            ]),
        child: InkWell(
          onTap: (){
            showSnackBar(context, "Like Button is clicked");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Assets.img.icons.thumbs.svg(),
              Text(
                '2.1k',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: themeData.colorScheme.onPrimary),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: themeData.colorScheme.surface,

      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
        
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_rounded),
                  ),
                  const SizedBox(
                    width: 18,
                  )
                ],
                title: const Text("Article"),
              ),
              SliverList(

                delegate:SliverChildListDelegate.fixed(

                  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Text(
                        "Four Things Every Woman Needs To Know",
                        style: themeData.textTheme.headline6,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Assets.img.stories.story7.image(
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Richard Gervain',
                                  style: themeData.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text('2m ago')
                              ],
                            ),
                          ),
                          IconButton(
                            color: themeData.colorScheme.primary,
                            icon: const Icon(CupertinoIcons.share),
                            onPressed: () {
                              showSnackBar(context, "Share button is clicked");
                            },
                          ),
                          IconButton(
                            color: themeData.colorScheme.primary,
                            icon: const Icon(CupertinoIcons.bookmark),
                            onPressed: () {
                              showSnackBar(context, "Bookmark button is clicked");


                            },
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(32), topLeft: Radius.circular(32)),
                      child: Assets.img.background.singlePost.image(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                      child: Text(
                          'A Man is sexuality is never your mind responsibility.',
                          style: themeData.textTheme.headlineSmall),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
                      child: Text(
                          """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like.
              
                  """),
                    )
                  ],
                ) ,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 116,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [

                    themeData.colorScheme.surface,
                    themeData.colorScheme.surface.withOpacity(0)
                  ]
                )
              ),
            ),
          )
        ],
      ),
    );
  }
  void showSnackBar (BuildContext context,  String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),behavior: SnackBarBehavior.fixed,));
  }
}
