

import 'package:cloud_firestore/cloud_firestore.dart';

class User{
 final  String username;
 final  String uid;
 final  String email;
 final  String bio;
 final  List followers;
 final  List following;
 final  String photoUrl;

 const User({
   required this.email,
   required this.photoUrl,
   required this.uid,
   required this.bio,
   required this.username,
   required this.followers,
   required this.following,
});

 Map<String,dynamic> toJson()=>{
   'username':username,
   'uid': uid,
   'email':email,
   'bio':bio,
   'followers': followers,
   'following':following,
   'photoUrl':photoUrl,
 };

 static User fromSnap(DocumentSnapshot snap){
   var snapshot= snap.data() as Map<String,dynamic>;
   return User(email: snapshot['email'], photoUrl: snapshot['photoUrl'], uid: snapshot['uid'],
       bio: snapshot['bio'],
       username: snapshot['username'], followers: snapshot['followers'],
       following: snapshot['following']);
 }

}