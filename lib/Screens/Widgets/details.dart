import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/Screens/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

List<String>images=[
  'assets/Images/3.png',
  'assets/Images/3.png',
  'assets/Images/3.png',
  'assets/Images/3.png',
];
class Datails extends StatefulWidget {
  Product p;
   Datails(this.p,{super.key});

  @override
  State<Datails> createState() => _DatailsState();
}

class _DatailsState extends State<Datails> {
  int current_index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Details',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child:CarouselSlider(
                  items:widget.p.images?.map((item) => Container(child: Center(
                    child: Image.network(item,fit: BoxFit.cover,width: 300,height:300,),
                  ),
                  ),
                  ).toList(),
                  options: CarouselOptions(
                    onPageChanged: (index,reason){
                      setState(() {
                        current_index=index;
                      });
                    },
                    height: 300,
                    enlargeCenterPage: true,
                    aspectRatio: 2,
                     autoPlay: true,
                    //reverse: true,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                  [
                for(int i=0;i<images.length;i++)
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: current_index==i?Colors.deepPurple:Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(2, 2)
                        ),
                      ]
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Padding(
                  padding: const  EdgeInsetsDirectional.only(start: 15),
                  child: Text('${widget.p.title}',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),),
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const  EdgeInsetsDirectional.only(start: 15),
                child: Center(
                  child: Text('${widget.p.brand}',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const  EdgeInsetsDirectional.symmetric(horizontal: 15),
                child: Text('${widget.p.description}',style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const  EdgeInsetsDirectional.only(start: 15),
                child: Text('Total in stock: ${widget.p.stock}',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ),
             // SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.only(left:30 ),
                  child: Row(
                    children: [
                      Text("Rating",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: RatingBar.builder(
                          initialRating: widget.p.rating,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text("Price",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                        Text("\$${widget.p.price} ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 40,
                      width: 200,
                      child: TextButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)){
                              return Colors.white;
                            }
                          }),
                        ),
                        onPressed: (){},
                        icon: Icon(Icons.add_shopping_cart_rounded,color: Colors.white,),
                        label:
                        Container(
                            child: Text("Add to Cart",style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),)),),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}