import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final String title;
  final String description;
  final IconData iconimg;
  final Color iconColor;

  const TaskList(
      {Key key, this.title, this.description, this.iconimg, this.iconColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Icon(iconimg, color: iconColor),
          Container(
            padding: EdgeInsets.only(left: 10, right: 18),
            width: MediaQuery.of(context).size.width * 0.8,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(description,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal))
            ]),
          ),
        ],
      ),
    );
  }
}
