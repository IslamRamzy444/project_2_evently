class Event {
  static const String colletionName="Events";
  String id;
  String image;
  String title;
  String description;
  String eventName;
  DateTime dateTime;
  String time;
  bool isFavorite;
  Event({this.id='',required this.image,required this.title,required this.description,required this.eventName,required this.dateTime,required this.time,this.isFavorite=false});
  Event.fromFireStore(Map<String,dynamic> data):this(
    id: data['id'],
    image: data['image'],
    title: data['title'],
    description: data['description'],
    eventName: data['event_name'],
    dateTime: DateTime.fromMillisecondsSinceEpoch(data['date_time']),
    time: data['time'],
    isFavorite: data['is_favorite']
  );
  Map<String,dynamic> toFireStore(){
    return {
      'id':id,
      'image':image,
      'title':title,
      'description':description,
      'event_name':eventName,
      'date_time':dateTime.millisecondsSinceEpoch,
      'time':time,
      'is_favorite':isFavorite
    };
  }
}