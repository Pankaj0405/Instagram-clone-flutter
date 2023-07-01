

import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
  final  String username;
  final  String uid;
  final  String description;
  final  String postId;
  final  String  postUrl;
  final  String   profImage;
  final   datePublished;
  final likes;

  const Post({
    required this.username,
    required this.description,
    required this.uid,
    required this.postId,
    required this.postUrl,
    required this.profImage,
    required this.likes,
    required this.datePublished,
  });

  Map<String,dynamic> toJson()=>{
    'username':username,
    'uid': uid,
    'description':description,
    'postId':postId,
    'datePublished': datePublished,
    'profImage':profImage,
    'likes':likes,
    "postUrl":postUrl,
  };

  static Post fromSnap(DocumentSnapshot snap){
    var snapshot= snap.data() as Map<String,dynamic>;
    return Post(username: snapshot[' username'], description: snapshot['description']
        , uid: snapshot['uid'], postId: snapshot['postId'],
        postUrl: snapshot['postUrl'], profImage: snapshot['profImage'],
        likes: snapshot['likes'], datePublished: snapshot['datePublished']);
  }

}