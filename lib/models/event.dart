class Event {
  static const String collectionName="Events";
  String id;
  String imageLight;
  String imageDark;
  String title;
  String description;
  String englishEventName;
  String arabicEventName;
  DateTime dateTime;
  String time;
  bool isFavorite;
  Event({this.id='',required this.imageLight,required this.imageDark,required this.title,required this.description,required this.englishEventName,required this.arabicEventName,required this.dateTime,required this.time,this.isFavorite=false});
  Event.fromFireStore(Map<String,dynamic> data):this(
    id: data['id'],
    imageLight:data['light_image'] ,
    imageDark:data['dark_image'] ,
    title: data['title'],
    description: data['description'],
    englishEventName:data['event_name_en'] ,
    arabicEventName:data['event_name_ar'] ,
    dateTime: DateTime.fromMillisecondsSinceEpoch(data['date_time']),
    time: data['time'],
    isFavorite: data['is_favorite']
  );
  Map<String,dynamic> toFireStore(){
    return {
      'id':id,
      'light_image':imageLight,
      'dark_image':imageDark,
      'title':title,
      'description':description,
      'event_name_en':englishEventName,
      'event_name_ar':arabicEventName,
      'date_time':dateTime.millisecondsSinceEpoch,
      'time':time,
      'is_favorite':isFavorite
    };
  }
}