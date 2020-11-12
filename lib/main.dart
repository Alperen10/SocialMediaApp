import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialhead/profilepage.dart';
import 'package:socialhead/shippingcard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Media',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.orangeAccent,
            size: 32.0,
          ),
          onPressed: () {},
        ),
        title: Text(
          "SocialHead",
          style: TextStyle(fontSize: 20.0, color: Colors.orangeAccent),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.purpleAccent,
                size: 32.0,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        children: <Widget>[
                          duyuru("Mert seni takip etti", "5 dk önce"),
                          duyuru("Namık gönderine yorum yaptı", "1 gün önce"),
                          duyuru("Tevfik mesaj gönderdi", "1 dk önce"),
                        ],
                      );
                    });
              })
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 100.0,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 3.0),
                blurRadius: 5.0,
              ),
            ]),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                createProfileCard(
                    "Yahya",
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS6zes53m4a_2VLTcmTn_bHk8NO5SkuWfcQbg&usqp=CAU",
                    "Yahya Solgun",
                    "https://cdn.pixabay.com/photo/2016/02/19/11/09/snow-covered-1209595__340.jpg"),
                createProfileCard(
                    "Namık",
                    "https://cdn.pixabay.com/photo/2015/03/03/20/42/man-657869__340.jpg",
                    "Namık Barış",
                    "https://cdn.pixabay.com/photo/2014/08/15/11/29/beach-418742__340.jpg"),
                createProfileCard(
                    "Kemal",
                    "https://cdn.pixabay.com/photo/2016/11/21/12/42/beard-1845166__340.jpg",
                    "Kemal Kara",
                    "https://cdn.pixabay.com/photo/2016/09/19/07/01/lake-irene-1679708__340.jpg"),
                createProfileCard(
                    "Tevfik",
                    "https://cdn.pixabay.com/photo/2016/11/18/19/07/happy-1836445__340.jpg",
                    "Tevfik Nazik",
                    "https://cdn.pixabay.com/photo/2013/11/15/13/57/road-210913__340.jpg"),
                createProfileCard(
                    "Fikret",
                    "https://cdn.pixabay.com/photo/2015/07/20/12/57/man-852766__340.jpg",
                    "Fikret Yıldırım",
                    "https://cdn.pixabay.com/photo/2017/05/09/03/46/alberta-2297204__340.jpg"),
                createProfileCard(
                    "Naim",
                    "https://cdn.pixabay.com/photo/2017/09/25/13/12/man-2785071__340.jpg",
                    "Naim Yıldırım",
                    "https://cdn.pixabay.com/photo/2017/01/16/19/40/mountains-1985027__340.jpg"),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ShippingCard(
            nameSurname: "Mert Yıldırım",
            passingTime: "1 yıl önce",
            description: "Pamukkale",
            profileImageLink:
                "https://cdn.pixabay.com/photo/2014/07/09/09/19/digital-388075__340.jpg",
            postImageLink:
                "https://cdn.pixabay.com/photo/2012/02/19/16/10/calcium-pools-14979__340.jpg",
          ),
          ShippingCard(
            nameSurname: "Canberk Yazar",
            passingTime: "10 ay önce",
            description: "Bizim Sivaslı",
            profileImageLink:
                "https://cdn.pixabay.com/photo/2016/11/21/14/53/adult-1845814__340.jpg",
            postImageLink:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQSSTmB4ux1Y4ctCI28yDShbHCuvV7hAp--Pw&usqp=CAU",
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.purpleAccent,
        child: Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
      ),
    );
  }

  Padding duyuru(String message, String passingTime) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            message,
            style: TextStyle(fontSize: 16.0),
          ),
          Text(passingTime),
        ],
      ),
    );
  }

  Widget createProfileCard(String userName, String imageUrl, String userSurname,
      String coverImageUrl) {
    return Material(
      child: InkWell(
        onTap: () async {
          bool data = await Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ProfilePage(
                    profileImageUrl: imageUrl,
                    userName: userName,
                    userSurname: userSurname,
                    coverImageUrl: coverImageUrl,
                  )));

          if (data) {
            print("Kullanıcı profil sayfasından döndü");
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Hero(
                    tag: userName,
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2.0, color: Colors.grey),
                        borderRadius: BorderRadius.circular(35.0),
                        image: DecorationImage(
                            image: NetworkImage(imageUrl), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                  )
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                userName,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
