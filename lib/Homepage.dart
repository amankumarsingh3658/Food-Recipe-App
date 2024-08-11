import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodrecipeapp/Api/getrecipe.dart';
import 'package:foodrecipeapp/Model/RecipeModel.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RecipeModel recipe = RecipeModel();
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    var height = mq.height;
    var width = mq.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff213a50), Color(0xff071938)])),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        alignLabelWithHint: true,
                        hintText: "Let's Cook Something",
                        prefixIcon: Icon(Icons.search),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40))),
                    controller: searchcontroller,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    'What Do You Want Too Cook?',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Lets Cook Something New',
                        style: GoogleFonts.poppins(
                            textStyle:
                                TextStyle(color: Colors.white60, fontSize: 20)),
                      )),
                  Container(
                      child: FutureBuilder(
                          future: getRecipe(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                "Loading",
                                style: TextStyle(color: Colors.white),
                              );
                            } else {
                              return Expanded(
                                child: ListView.builder(
                                    itemBuilder: (context, index) {
                                  return Text(
                                    snapshot.data.toString(),
                                    style: TextStyle(color: Colors.white),
                                  );
                                }),
                              );
                            }
                          }))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
