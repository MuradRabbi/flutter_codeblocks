import 'package:flutter/material.dart';



class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Shopping Cart", style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          cartItemWidget(),
          Spacer(),
          calculation(),
          Spacer(),
          checkOutButton()

        ],
      ),
    );
  }

  Widget cartItemWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding:EdgeInsets.symmetric(horizontal: 10),
          child: Text("Into Your Cart", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, ),),
        ),
        SizedBox(height: 20,),
        SizedBox(
            height: 200,
            child: allCartItem()
        ),
        SizedBox(height: 10,),
        Container(
          height: 1,
          color: Colors.green,
        )

      ],
    );
  }

  Widget allCartItem(){
    return Container(
        child: ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return cartItem();
          },
        ));
  }

  Widget cartItem(){
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05), // Shadow color
            spreadRadius: 2, // How far the shadow should spread from the widget
            blurRadius: 5, // The blur radius of the shadow
            offset: Offset(0, 3), // Offset of the shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white
            ),


          ),
          Text("Gree GS-18XLMV32", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Text("৳ 68,800 ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),),
          SizedBox(height: 10,),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            height: 36 ,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.white , width: 1.5)
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          bottomLeft: Radius.circular(6),
                        )
                    ),
                    child: Icon(Icons.add, color: Colors.white,),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: Text("1"),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6),
                          bottomRight: Radius.circular(6),
                        )
                    ),
                    child: Icon(Icons.remove, color: Colors.white,),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  
  Widget calculation(){
    return Container( 
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(  
        borderRadius: BorderRadius.circular(6),
        color: Colors.green.withOpacity(0.15)
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 6

          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            calculationItem("Subtotal :", "৳ 5,900"),
            Container(height: 1, color: Colors.green.withOpacity(0.15),margin: EdgeInsets.symmetric(horizontal: 8),),
            calculationItem("Vat :", "৳ 100",),
            Container(height: 1, color: Colors.green.withOpacity(0.15),margin: EdgeInsets.symmetric(horizontal: 8),),
            calculationItem("Delivery Charge :", "৳ 100"),
            Container(height: 1, color: Colors.green.withOpacity(0.15),margin: EdgeInsets.symmetric(horizontal: 8),),
            calculationItem("Total :", "৳ 6,100")
          ],
        ),
      ),
    );
  }

  Widget calculationItem(String title , String amount){
    return  Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title, style: TextStyle(fontSize: 14,),),
              Text(amount, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
            ],
          ),
        ),

      ],
    );
  }


  Widget checkOutButton(){
    return GestureDetector(
      onTap: (){},
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.green
        ),
        child: Text("Check Out", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),),
      ),
    );
  }
}
