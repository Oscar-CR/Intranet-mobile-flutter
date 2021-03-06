import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/skeletons/stylings.dart';
import 'package:intranet_movil/widget/skeletons/widgets.dart';

class ListviewCompanyPage extends StatefulWidget {
  const ListviewCompanyPage({Key? key}) : super(key: key);

  @override
  _ListviewCardsExamplePageState createState() =>
      _ListviewCardsExamplePageState();
}

class _ListviewCardsExamplePageState extends State<ListviewCompanyPage> {
  final bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        padding: const EdgeInsets.only(top: 18),
        child: _isLoading ? _skeletonView() : const ListviewCompanyPage(),
      ),
    );
  }

  Widget _skeletonView() => ListView.builder(
        // padding: padding,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 12,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            padding: const EdgeInsets.all(8.0),
            child: SkeletonItem(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      shape: BoxShape.circle, height: 48, width: 48),
                ),
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 8,
                              width: 120,
                              borderRadius: BorderRadius.circular(5),
                              alignment: Alignment.bottomLeft),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 16)),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 8,
                              width: 80,
                              borderRadius: BorderRadius.circular(5),
                              alignment: Alignment.bottomLeft),
                        )
                      ],
                    ))
              ],
            )),
          ),
        ),
      );
}
