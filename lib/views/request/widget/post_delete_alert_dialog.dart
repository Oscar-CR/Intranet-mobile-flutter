import 'package:flutter/material.dart';
import 'package:intranet_movil/services/post_post_delete.dart';
import 'package:intranet_movil/views/home/home_page.dart';
import 'package:intranet_movil/views/home/widget/publication.dart';
import 'package:intranet_movil/views/home/widget/publication_card.dart';
import 'package:intranet_movil/views/request/request_main_page.dart';

class PostDelete {
  showPostDelete(
    BuildContext contex,
    String token,
    String publciationID,
  ) {
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(contex);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Aceptar"),
      onPressed: () {
        postPostDelete(token, publciationID);
        Navigator.pop(contex);
        Navigator.pushAndRemoveUntil(
            contex,
            MaterialPageRoute(builder: (context) => const HomePage()),
            ModalRoute.withName("/PostPage"));
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Eliminar"),
      content: const Text("Desea eliminar esta Publicación"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: contex,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
