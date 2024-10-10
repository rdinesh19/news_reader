//
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:hive/hive.dart';
// import 'package:user/jobs/network/job_network.dart';
//
// import '../chats/models/chat_group_model.dart';
// import '../chats/models/hive/chat_message_hive.dart';
// import '../common/component/shared_preference.dart';
// import '../jobs/model/job_model.dart';
// import '../notification/network/notification_network.dart';
// import '../vender/venderJobs/network/jobNetwork.dart';
//
//
// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'high_importance_channel',
//   'High Importance Notifications',
//   importance: Importance.high,
//   playSound: true,
// );
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();
//
// const AndroidInitializationSettings initializationSettingsAndroid =
// AndroidInitializationSettings('@mipmap/ic_launcher');
//
// DarwinInitializationSettings initializationSettingsIOS =
// DarwinInitializationSettings(
//   requestSoundPermission: true,
//   requestBadgePermission: true,
//   requestAlertPermission: true,
// );
//
// final InitializationSettings initializationSettings = InitializationSettings(
//   android: initializationSettingsAndroid,
//   iOS: initializationSettingsIOS,
// );
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//       AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onDidReceiveBackgroundNotificationResponse: onselectnotication,
//       onDidReceiveNotificationResponse: onselectnotication);
//   RemoteNotification notification = message.notification!;
//   AndroidNotification android = message.notification!.android!;
//
//     flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             channel.id,
//             channel.name,
//             color: Colors.blue,
//             playSound: true,
//             icon: '@mipmap/ic_launcher',
//           ),
//         ),
//         payload: json.encode(message.data));
//
// }
//
//
// routeTo(var data) async {
//   int loginStatus = await getLoginStatus();
//   if (loginStatus == 0) {
//     Modular.to.pushNamed('/splashScreen');
//   } else if (loginStatus == 2) {
//     if (data["type"] == "11") {
//       Modular.to.pushNamed('/vendorNotification');
//     } else if (data["type"] == "12") {
//       var vendorData =
//       await JobNetwork().getJobBasedOnId(data["job_id"], forPush: true);
//       Modular.to.pushNamed('/vendereligiblecandidate',
//           arguments: [JobModel.fromJson(vendorData)]);
//     } else if (data["type"] == "13") {
//       var jobData =
//       await JobNetwork().getJobBasedOnId(data["job_id"], forPush: true);
//       var candidateData = await VenderJobNetwork()
//           .getSingleCandidate(data["candidate_id"], forPush: true);
//       var data1 = {
//         "_id": data["group_id"],
//         "job_id": jobData,
//         "candidate_id": candidateData
//       };
//       await Hive.openBox<ChatMessageHive>(data["group_id"]);
//       var data2 = ChatGroupModel.fromJson(json.decode(json.encode(data1)));
//       Modular.to.pushNamed('/vendorChattingPage', arguments: [data2]);
//     } else if (data["type"] == "14") {
//       Modular.to.pushNamed('/venderHomePage', arguments: [1]);
//     } else {
//       Modular.to.pushNamed('/vendorNotification');
//     }
//   } else {
//     if (data["type"] == "1") {
//       Modular.to.pushNamed('/notification');
//     } else if (data["type"] == "2") {
//       Modular.to.pushNamed('/landing', arguments: [1]);
//     } else if (data["type"] == "3") {
//       var jobData =
//       await JobNetwork().getJobBasedOnId(data["job_id"], forPush: true);
//       var data1 = {"_id": data["group_id"], "job_id": jobData};
//       await Hive.openBox<ChatMessageHive>(data["group_id"]);
//       var data2 = ChatGroupModel.fromJson(json.decode(json.encode(data1)));
//       Modular.to.pushNamed('/chattingPage', arguments: [data2]);
//     } else if (data["type"] == "5" || data["type"] == "6") {
//       NotificationNetwork().changeNotificationStatus(data["job_id"]);
//       JobModel? jobData = await JobNetwork().getJobBasedOnId(data["job_id"]);
//       Modular.to.pushNamed('/jobDetail', arguments: [[jobData!], 0, 0, 0, []]);
//     } else {
//       Modular.to.pushNamed('/notification');
//     }
//   }
// }
//
// onselectnotication(NotificationResponse payload) async {
//   var data = json.decode(payload.payload!);
//   routeTo(data);
// }
//
// /////////////////////////////////////////////////////////////////////////////////////////////
//
// pushNotificationInitialization1()async{
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true, badge: true, sound: true);
//
//   if (Platform.isAndroid) {
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//   } else if (Platform.isIOS) {
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//         IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//     onDidReceiveBackgroundNotificationResponse: onselectnotication,
//     onDidReceiveNotificationResponse: onselectnotication
//       );
//
// }
//
// /////////////////////////////////////////////////////////////////////////////////////////////
//
// pushNotificationInitialization2(BuildContext context,String userId){
//   // FirebaseMessaging.instance.subscribeToTopic("topics/$userId");
//   FirebaseMessaging.instance
//       .getInitialMessage()
//       .then((RemoteMessage? message) async {
//     if (message != null) {
//       routeTo(message.data); }
//   });
//
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//     RemoteNotification notification = message.notification!;
//   AndroidNotification android = message.notification!.android!;
//   int pageStatus = await getPageStatus();
//   var data = message.data;
//     var lastMessageId = "";
//   // if(lastMessageId != ){
//   //
//   // }
//   if (data["type"] == "4") {
//     Modular.to.pushNamed('/incomingCall', arguments: [
//       data["message"],
//       data['company_name'],
//       data['interview_id']
//     ]);
//   } else if (data["type"] == "3" && pageStatus == 2) {
//   }
//   else {
//
//       flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//               android: AndroidNotificationDetails(channel.id, channel.name,
//                   channelDescription: channel.description,
//                   color: Theme.of(context).colorScheme.primary,
//                   playSound: true,
//                   icon: '@mipmap/ic_launcher'),
//               iOS: DarwinNotificationDetails(
//                 presentAlert: true,
//                 presentBadge: true,
//                 presentSound: true,
//               )),
//           payload: json.encode(message.data));
//
//   }
//   }
//   );
//
//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//     RemoteNotification notification = message.notification!;
//     AndroidNotification android = message.notification!.android!;
//     routeTo(message.data);
//   });
// }
//
// /////////////////////////////////////////////////////////////////////////////////////////////
//
// subscribeTopic(String topic )async{
//
//   // var userId = await getUserId();
//   FirebaseMessaging.instance.subscribeToTopic(topic);
//
// }