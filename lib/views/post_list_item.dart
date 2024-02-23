import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machines_talk_init/models/post_model.dart';
import 'package:provider/provider.dart';

import '../viewmodels/dtails_viewmodel.dart';

class ListItemWidget extends StatelessWidget {
  final PostModel post;

  ListItemWidget(this.post);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        height: 100.0, // Hauteur fixe pour tous les éléments
        child: ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage('https://via.assets.so/game.png?id=1&q=95&w=360&h=360&fit=fill'),
            radius: 25.0,
          ),
          title: Text(
            post.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            post.body,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          onTap: () async {
            Provider.of<DetailsViewModel>(context, listen: false).selectItem(post);
            await Provider.of<DetailsViewModel>(context, listen: false).saveSelectedPostId();
            Navigator.pushNamed(context, '/details');
          },
        ),
      ),
    );
  }
}
