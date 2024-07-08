// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/ProductModel.dart';
import '../screens/updatepage.dart';

class CustomCard extends StatefulWidget {
  final ProductModel product;

  CustomCard(this.product, {super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool bol = false;

  IconData icon = FontAwesomeIcons.solidHeart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdatePage.id, arguments: widget.product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  color: Colors.grey.withOpacity(0),
                  spreadRadius: 0,
                  offset: const Offset(10, 10))
            ]),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                surfaceTintColor: Colors.white,
                elevation: 10,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.product.title.substring(0, 6),
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' '${widget.product.price.toString()}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                bol = !bol;
                              });
                            },
                            icon: ((bol == false)
                                ? Icon(Icons.shopping_cart_checkout)
                                : Icon(Icons.remove_shopping_cart)),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
          Positioned(
            left: 40,
            bottom: 100,
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 100,
              width: 100,
              child: Image.network(widget.product.image),
            ),
          ),
        ],
      ),
    );
  }
}
