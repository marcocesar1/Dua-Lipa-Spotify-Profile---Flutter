import 'dart:math';

import 'package:dua_lipa_spotify_profile/constants/songs.dart';
import 'package:dua_lipa_spotify_profile/widgets/choice_tab.dart';
import 'package:dua_lipa_spotify_profile/widgets/title.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

const blankImage =
    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/White_Background_%28To_id_screen_dust_during_cleanup%29.jpg/1280px-White_Background_%28To_id_screen_dust_during_cleanup%29.jpg';
const dualipaImage2 =
    'https://www.thetimes.com/imageserver/image/%2Fmethode%2Fsundaytimes%2Fprod%2Fweb%2Fbin%2Fc23f0d64-0060-11ee-91d8-175820cfdf88.jpg?crop=1500%2C1000%2C0%2C0';

const dualipaImage3 =
    'https://www.lollapaloozamania.com/wp-content/uploads/2017/09/Dua-Lipa.jpg';
const dualipaImage =
    'https://dwgyu36up6iuz.cloudfront.net/heru80fdn/image/upload/c_fill,d_placeholder_thenewyorker.png,fl_progressive,g_face,h_1080,q_80,w_1920/v1571423453/thenewyorker_the-new-yorker-festival-dua-lipa-on-her-journey-to-pop-stardom.jpg';

class _ProfileScreenState extends State<ProfileScreen> {
  double offset = 0;
  double extra = 0;
  final scrollController = ScrollController();
  final double toolbarHeight = 50;

  late final double expandedHeight = MediaQuery.of(context).size.height * 0.35;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      setState(() {
        extra = min(max(0, scrollController.offset / 5 - 16), kToolbarHeight);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            //expandedHeight: 270,
            expandedHeight: expandedHeight,
            collapsedHeight: 90,
            stretch: true,
            backgroundColor: Colors.black,
            foregroundColor: Colors.transparent,
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  expandedTitleScale: 1,
                  background: Image.network(
                    dualipaImage,
                    fit: BoxFit.cover,
                  ),
                  titlePadding: const EdgeInsets.all(24),
                  title: const ArtistInfo()),
            ),
          ),
          const SliverToBoxAdapter(),
          SliverAppBar(
            backgroundColor: Colors.black,
            toolbarHeight: toolbarHeight + extra,
            title: Column(
              children: [
                SizedBox(height: extra),
                const ChoiceTab(),
              ],
            ),
            primary: false,
            pinned: true,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final song = listDuaLipaSongs[index];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '#${(index + 1).toString()}',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 166, 163, 163),
                                fontSize: 16),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              width: 65,
                              height: 65,
                              fit: BoxFit.cover,
                              song.albumCoverUrl,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                song.songName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(children: [
                                Icon(
                                  Icons.headphones,
                                  color: Colors.grey[400]!,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '63,527,129',
                                  style: TextStyle(
                                    color: Colors.grey[400]!,
                                    fontSize: 13,
                                  ),
                                )
                              ])
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              childCount: listDuaLipaSongs.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}
