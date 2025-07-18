import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_2_evently/models/event.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventsCollection(){
    return FirebaseFirestore.instance.collection(Event.colletionName).withConverter<Event>(
      fromFirestore: (snapshot, options) => Event.fromFireStore(snapshot.data()!), 
      toFirestore: (event, options) =>event.toFireStore() ,
    );
  }
  static Future<void> addEventToFirestore(Event event){
    var eventsCollection= getEventsCollection();
    DocumentReference<Event> docRef=eventsCollection.doc();
    event.id=docRef.id;
    return docRef.set(event);
  }
}