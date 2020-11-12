import 'package:flutter/material.dart';
import 'package:socialhead/shippingcard.dart';

class ProfilePage extends StatelessWidget {

  final String userSurname;
  final String userName;
  final String coverImageUrl;
  final String profileImageUrl;

  const ProfilePage({Key key, this.userSurname, this.userName, this.coverImageUrl, this.profileImageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 230.0,
              ),
              Container(
                height: 180.0,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  image: DecorationImage(image: NetworkImage(coverImageUrl),fit: BoxFit.cover),

                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 0.0,
                  child: Hero(
                    tag: userName,
                                child: Container(
                  width: 120.0,
                  height: 120.0,              
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(60.0),
                    border: Border.all(width: 2.0,color:Colors.white),
                    image: DecorationImage(image: NetworkImage(profileImageUrl),fit: BoxFit.cover),

                  ),
                ),
                              ),
              ),
              Positioned(
                top: 190.0,
                left: 145.0,

                              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      userSurname,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color:Colors.black,
                      ),
                      ),
                      Text(
                      userName,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color:Colors.grey,
                      ),
                      ),
                  ],

                ),
              ),
              Positioned(
                top: 130.0,
                right: 15.0,
                              child: Container(
                  width: 100.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[200],
                    border: Border.all(width: 2.0,color:Colors.white)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.add_circle,size: 18.0,),
                      SizedBox(width: 2.0,),
                      Text(
                        "Takip Et",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color:Colors.black,
                        ),
                        ),

                    ],
                  ),
                ),
              ),
              IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
                Navigator.pop(context,true);
              },)
            ],
          ),
          SizedBox(height: 20.0,),
          Container(
            height: 75.0,
            color: Colors.grey.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                counter("Takipçi","10K"),
                counter("Takip", "1000"),
                counter("Paylaşım","120"),
              ],
            ),

          ),
          ShippingCard(
            nameSurname: "Canberk Yazar",
            passingTime: "10 ay önce",
            description: "Bizim Sivaslı",
            profileImageLink: "https://cdn.pixabay.com/photo/2016/11/21/14/53/adult-1845814__340.jpg",
            postImageLink: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQSSTmB4ux1Y4ctCI28yDShbHCuvV7hAp--Pw&usqp=CAU",
            )

        ],
      ),

      
    );
  }

  Column counter(String title,String number) {
    return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    number,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 1.0,),
                   Text(
                    title,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              );
  }
}

