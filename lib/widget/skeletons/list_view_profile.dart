import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/skeletons/stylings.dart';
import 'package:intranet_movil/widget/skeletons/widgets.dart';

class ListviewProfile extends StatefulWidget {
  const ListviewProfile({Key? key}) : super(key: key);

  @override
  _ListviewCardsExamplePageState createState() =>
      _ListviewCardsExamplePageState();
}

class _ListviewCardsExamplePageState extends State<ListviewProfile> {
  final bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Container(
        child: _isLoading ? _skeletonView() : const ListviewProfile(),
      ),
    );
  }

  Widget _skeletonView() => ListView.builder(
        // padding: padding,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(0),
          child: SkeletonItem(
              child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .30,
                    child: const SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        height: 190,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 5,
                    child: const SizedBox(
                      width: 150,
                      height: 150,
                      child: Align(
                        alignment: Alignment(2, 0.5),
                        child: SizedBox(
                          width: 120.0,
                          height: 120.0,
                          child: SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    left: 100,
                  ),
                ],
              ),
              const SizedBox(
                height: 95,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  children: [
                    SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          lines: 2,
                          spacing: 6,
                          lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 12,
                              borderRadius: BorderRadius.circular(8),
                              minLength: MediaQuery.of(context).size.width / 6,
                              maxLength: MediaQuery.of(context).size.width / 2,
                              alignment: Alignment.bottomCenter)),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          lines: 3,
                          spacing: 10,
                          lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 8,
                              borderRadius: BorderRadius.circular(8),
                              minLength: MediaQuery.of(context).size.width / 6,
                              maxLength: MediaQuery.of(context).size.width / 2,
                              alignment: Alignment.bottomLeft)),
                    ),
                  ],
                ),
              )
            ],
          )),
        ),
      );
}
