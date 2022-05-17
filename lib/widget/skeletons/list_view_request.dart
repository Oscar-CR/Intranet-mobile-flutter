import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/skeletons/stylings.dart';
import 'package:intranet_movil/widget/skeletons/widgets.dart';

class ListviewRequestPage extends StatefulWidget {
  @override
  _ListviewCardsExamplePageState createState() =>
      _ListviewCardsExamplePageState();
}

class _ListviewCardsExamplePageState extends State<ListviewRequestPage> {
  bool _isLoading = true;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        child: _isLoading ? _skeletonView() : _contentView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleLoading,
        child: Icon(
          _isLoading ? Icons.hourglass_full : Icons.hourglass_bottom,
        ),
      ),
    );
  }

  Widget _skeletonView() => ListView.builder(
        // padding: padding,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 50,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            decoration: const BoxDecoration(color:Colors.white ,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            padding: const EdgeInsets.all(8.0),
            child: SkeletonItem(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 1,
                      spacing: 2,
                      lineStyle: SkeletonLineStyle(
                          randomLength: true,
                          width: double.infinity,
                          height: 16,
                          borderRadius: BorderRadius.circular(8),
                          minLength: MediaQuery.of(context).size.width / 2,
                          alignment: Alignment.bottomLeft)),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 16,
                          width: 80,
                          borderRadius: BorderRadius.circular(5),
                          alignment: Alignment.bottomCenter),
                    ),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 16,
                          width:  200,
                          borderRadius: BorderRadius.circular(5),
                          alignment: Alignment.bottomCenter),
                    )
                  ],
                )
                
                )
                
              ],
            )),
          ),
        ),
      );

  Widget _contentView() => ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            color: Colors.white,
            height: doubleInRange(MediaQuery.of(context).size.height / 8,
                MediaQuery.of(context).size.height / 2),
            child: const Center(
              child: Text(
                "CONTENT",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
}
