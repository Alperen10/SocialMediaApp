import 'package:flutter/material.dart';

class ShippingCard extends StatelessWidget {

  final String profileImageLink;
  final String nameSurname;
  final String passingTime;
  final String postImageLink;
  final String description;

  const ShippingCard({Key key, this.profileImageLink, this.nameSurname, this.passingTime, this.postImageLink, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        elevation: 1.0,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          padding: EdgeInsets.all(15.0),
          width: double.infinity,
          height: 388.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.grey[100],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.indigo,
                            image: DecorationImage(
                                image: NetworkImage(
                                  profileImageLink,
                                  ),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nameSurname,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            passingTime,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.more_vert),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.network(
                postImageLink,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Mybutton(myIcon: Icons.favorite,yazi: "Beğen",myFunction: (){print("Beğen");},),
                  Mybutton(myIcon: Icons.comment,yazi: "Yorum yap",myFunction: (){print("Yorum");},),
                  FlatButton.icon(onPressed: (){}, icon: Icon(Icons.share,color: Colors.grey), label:Text("Paylaş",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold))),


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Mybutton extends StatelessWidget {

  final IconData myIcon;
  final String yazi;
  final myFunction;

  Mybutton({this.myIcon, this.yazi, this.myFunction});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white12,
      child: InkWell(
        onTap:myFunction,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Icon(
                myIcon,
                color: Colors.grey,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(yazi,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
