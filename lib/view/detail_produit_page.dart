import 'package:flutter/material.dart';
import 'package:amazonmini/model/my_produit.dart';
import 'package:amazonmini/view/my_background.dart';

class MyDetailProduct extends StatefulWidget {
  MyProduct product;
  MyDetailProduct({super.key, required this.product});

  @override
  State<MyDetailProduct> createState() => _MyDetailProductState();
}

class _MyDetailProductState extends State<MyDetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.nom),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          MyBackground(),
          Center(
            child:  Column(
                children: [
                  Spacer(),
                  Container(
                    height: 400,
                    width: 500,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(widget.product.photos[0])
                        )
                    ),
                  ),
                  Text(widget.product.desc),
                  Text("Prix : ${widget.product.prix} €"),
                  Spacer(),
                  ElevatedButton(
                      onPressed: (){
                        //mettre dans le panier
                      },
                      child: Text("Mettre dans le panier")
                  ),
                  Spacer(),
                ]

            ),
          )

        ],
      ),
      
    );
  }
}
