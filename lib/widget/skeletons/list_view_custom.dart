import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/skeletons/stylings.dart';
import 'package:intranet_movil/widget/skeletons/widgets.dart';

class ListViewExample2Page extends StatefulWidget {
  const ListViewExample2Page({Key? key}) : super(key: key);

  @override
  _ListViewExample2PageState createState() => _ListViewExample2PageState();
}

class _ListViewExample2PageState extends State<ListViewExample2Page> {
  final bool _isLoading = true;

  final random =  Random();

  String randomText() => texts[random.nextInt(5)];

  final List<String> texts = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    "Sed blandit purus in ornare facilisis.",
    "Pellentesque euismod lectus sit amet felis fringilla, ut tempor justo pulvinar.",
    "Nullam lobortis sem eu porta rhoncus.",
    "Cras sed eros a dolor viverra luctus id interdum ante.",
    "Mauris aliquet sapien rutrum enim dignissim tincidunt.",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:const EdgeInsets.all(24),
        child: Skeleton(
        isLoading: _isLoading,
        skeleton: _skeletonView(),
        child: _contentView(),
        ),
      )
      
    );
  }

  Widget _skeletonView() => SkeletonListView(
        item: SkeletonListTile(
          verticalSpacing: 12,
          leadingStyle: const  SkeletonAvatarStyle(
              width: 64, height: 64, shape: BoxShape.circle),
          titleStyle: SkeletonLineStyle(
              height: 16,
              minLength: 200,
              randomLength: true,
              borderRadius: BorderRadius.circular(12)),
          subtitleStyle: SkeletonLineStyle(
              height: 12,
              maxLength: 200,
              randomLength: true,
              borderRadius: BorderRadius.circular(12)),
          hasSubtitle: true,
        ),
      );

  Widget _contentView() => ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: const  BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/placeholder.png")),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    randomText(),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 16),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    randomText(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ))
            ],
          ),
        ),
      );
}
//  ListView.builder(
//         physics: NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) => Container(),
//       )
