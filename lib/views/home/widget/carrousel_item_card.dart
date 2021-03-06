import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intranet_movil/model/communique.dart';
import 'package:intranet_movil/utils/constants.dart';

class CarrouselItemCard extends StatefulWidget {
  const CarrouselItemCard({Key? key, required this.communiqueData})
      : super(key: key);

  final List<CommuniqueModel> communiqueData;

  @override
  State<CarrouselItemCard> createState() => _CarrouselItemCardState();
}

class _CarrouselItemCardState extends State<CarrouselItemCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: widget.communiqueData[0].image == "/img/communique.svg"
          ? const Image(
              image: AssetImage('lib/assets/communique.png'),
              fit: BoxFit.contain,
            )
          : CachedNetworkImage(
              imageUrl:
                  ApiIntranetConstans.baseUrl + widget.communiqueData[0].image,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Image(
                  image: AssetImage("lib/assets/lost_connection.png")),
            ),
      onDoubleTap: () {
        if (widget.communiqueData[0].image == "/img/communique.svg") {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Image(
                    image: AssetImage('lib/assets/communique.png'),
                    fit: BoxFit.contain,
                  )));
        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CachedNetworkImage(
                  imageUrl: ApiIntranetConstans.baseUrl +
                      widget.communiqueData[0].image,
                  errorWidget: (context, url, error) => const Image(
                      image: AssetImage("lib/assets/lost_connection.png")))));
        }
      },
    );
  }
}
