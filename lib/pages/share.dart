// import 'package:flutter/material.dart';
// import 'package:installed_apps/app_info.dart';
// import 'package:installed_apps/installed_apps.dart';

// class SharePage extends StatefulWidget {
//   const SharePage({super.key});

//   @override
//   State<SharePage> createState() => _SharePageState();
// }

// class _SharePageState extends State<SharePage> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<AppInfo>>(
//       future: InstalledApps.getInstalledApps(true, true),
//       builder:
//           (BuildContext buildContext, AsyncSnapshot<List<AppInfo>> snapshot) {
//         return snapshot.connectionState == ConnectionState.done
//             ? snapshot.hasData
//                 ? Column(
//                     children: [
//                       Text(
//                         'Share the post via',
//                         style: TextStyle(
//                           fontFamily: 'Noto Sans Regular',
//                           color: Colors.grey[600],
//                           fontWeight: FontWeight.w400,
//                           fontSize: 12.0,
//                         ),
//                       ),
//                       ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         // shrinkWrap: true,
//                         // physics: NeverScrollableScrollPhysics(),
//                         itemCount: snapshot.data!.length,
//                         itemBuilder: (context, index) {
//                           AppInfo app = snapshot.data![index];
//                           return SizedBox(
//                             height: 50.0,
//                             width: 50.0,
//                             child: Card(
//                               child: ListTile(
//                                 leading: CircleAvatar(
//                                   backgroundColor: Colors.transparent,
//                                   child: Image.memory(app.icon!),
//                                 ),
//                                 title: Text(app.name!),
//                                 onTap: () =>
//                                     InstalledApps.startApp(app.packageName!),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   )
//                 : const Center(
//                     child: Text(
//                         "Error occurred while getting installed apps ...."))
//             : const Center(child: Text("Please wait..."));
//       },
//     );
//   }
// }
