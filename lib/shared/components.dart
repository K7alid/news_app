import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../modules/web_view_screen.dart';

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(article["url"]));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: SizedBox(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[200],
      ),
    );

Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (BuildContext context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length,
      ),
      fallback: (BuildContext context) => isSearch
          ? Container()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );

Widget defaultTextFormField({
  required String text,
  required IconData prefix,
  IconData? suffix,
  double radius = 0.0,
  required TextInputType textInputType,
  required var controller,
  var onSubmitted,
  var onChange,
  Function()? onTap,
  required validate,
  var onSuffixPressed,
  bool isPassword = false,
}) =>
    TextFormField(
      obscureText: isPassword,
      validator: validate,
      controller: controller,
      onFieldSubmitted: onSubmitted,
      onChanged: onChange,
      onTap: onTap,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        labelText: text,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: onSuffixPressed,
              )
            : null,
      ),
    );

void navigateTo(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );

//
// Widget buildTaskItem(Map model, context) => Dismissible(
//       key: Key(model['id'].toString()),
//       onDismissed: (direction) {
//         AppCubit.get(context).deleteData(
//           id: model['id'],
//         );
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             CircleAvatar(
//               child: Text(
//                 model['time'],
//                 style: const TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//               radius: 40.0,
//               backgroundColor: Colors.teal,
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     model['title'],
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     model['date'],
//                     style: const TextStyle(color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             IconButton(
//               onPressed: () {
//                 AppCubit.get(context).updateData(
//                   status: 'done',
//                   id: model['id'],
//                 );
//               },
//               icon: const Icon(
//                 Icons.check_box_outlined,
//                 color: Colors.teal,
//               ),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             IconButton(
//               onPressed: () {
//                 AppCubit.get(context).updateData(
//                   status: 'archived',
//                   id: model['id'],
//                 );
//               },
//               icon: const Icon(
//                 Icons.archive_outlined,
//                 color: Colors.teal,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//

//
// Widget taskBuilder({
//   required List<Map> tasks,
// }) =>
//     ConditionalBuilder(
//       condition: tasks.isNotEmpty,
//       builder: (context) => ListView.separated(
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
//         separatorBuilder: (context, index) => myDivider(),
//         itemCount: tasks.length,
//       ),
//       fallback: (context) => Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [
//             Icon(
//               Icons.menu,
//               size: 100.0,
//               color: Colors.grey,
//             ),
//             Text(
//               'No Tasks Yet, Please Add Some',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey,
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
