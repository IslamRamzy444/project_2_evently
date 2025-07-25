import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_2_evently/models/event.dart';
import 'package:project_2_evently/models/my_user.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventsCollection(String uId){
    return getUsersCollection().doc(uId).collection(Event.collectionName).withConverter<Event>(
      fromFirestore: (snapshot, options) => Event.fromFireStore(snapshot.data()!), 
      toFirestore: (event, options) =>event.toFireStore() ,
    );
  }
  static Future<void> addEventToFirestore(Event event,String uId){
    var eventsCollection= getEventsCollection(uId);
    DocumentReference<Event> docRef=eventsCollection.doc();
    event.id=docRef.id;
    return docRef.set(event);
  }
  static CollectionReference<MyUser> getUsersCollection(){
    return FirebaseFirestore.instance.collection(MyUser.collectionName).withConverter<MyUser>(
      fromFirestore: (snapshot, options) => MyUser.fromFireStore(snapshot.data()!), 
      toFirestore: (myUser, options) =>myUser.toFireStore() ,
    );
  }
  static Future<void>addUserToFireStore(MyUser myUser){
    var userCollection=getUsersCollection();
    DocumentReference<MyUser> docRef=userCollection.doc(myUser.id);
    return docRef.set(myUser);
  }
  static Future<MyUser?> readUserFromFirestore(String id) async{
    var querySnapShot=await getUsersCollection().doc(id).get();
    return querySnapShot.data();
  }
}