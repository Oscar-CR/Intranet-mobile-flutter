import 'package:flutter/material.dart';
import 'package:intranet_movil/services/post_post_delete.dart';
import 'package:intranet_movil/views/home/home_page.dart';

class PostDelete {
  showPostDelete(
    BuildContext cont,
    String token,
    String publciationID,
  ) {
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(cont);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Aceptar"),
      onPressed: () {
        postPostDelete(token, publciationID);
        Navigator.pop(cont);
        Navigator.pushAndRemoveUntil(
            cont,
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
      context: cont,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class OpenBottonSheet {
  openBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Editar"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.save),
                title: const Text("Guardar"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text("Eliminar"),
                onTap: () {
                  /*Navigator.pop(context);
                  PostDelete().showPostDelete(cont, token, publciationID);*/
                },
              ),
            ],
          );
        });
  }
}
