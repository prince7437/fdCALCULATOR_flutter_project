import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    ));

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  TextEditingController _controller3 = new TextEditingController();
   double? interest;
 double?  total;

  //_controller.text is Amount
  //_controller.text is Interrest Rate
  //_controller.text is Period

  void calculation() {
    final calinterrestrate = (double.parse(_controller2.text) / 100 / 12) *
        int.parse(_controller3.text);
    final calinterest = calinterrestrate * int.parse(_controller1.text);
    setState(() {
      interest = calinterest;
      total = int.parse(_controller1.text) + interest!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        leading: Icon(
          Icons.notes,
          size: 30,
          color: Colors.white,
        ),
        toolbarHeight: 30,
        backgroundColor: Colors.yellow,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.info,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Fixed Deposite",
                      style: GoogleFonts.robotoMono(
                          fontSize: 35, color: Colors.black),
                    ),
                    Text(
                      "Calculator",
                      style: GoogleFonts.robotoMono(
                          fontSize: 35, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 40, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                inputForm(
                    title: "Deposite Amount :",
                    controller: _controller1,
                    hinttext: "e.g 20000"),
                inputForm(
                    title: "Annual Interest Rate(%) :",
                    controller: _controller2,
                    hinttext: "e.g 3"),
                inputForm(
                    title: "Period(in month):",
                    controller: _controller3,
                    hinttext: "e.g 3"),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    calculation();
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        "CALCULATE",
                        style: GoogleFonts.robotoMono(
                            fontSize: 25, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                interest != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Results :",
                            style: GoogleFonts.robotoMono(fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "Interest: RM" + interest!.toStringAsFixed(2),
                              style: GoogleFonts.robotoMono(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "Total: RM" + total!.toStringAsFixed(2),
                              style: GoogleFonts.robotoMono(fontSize: 20),
                            ),
                          ),
                        ],
                      )
                    : SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget inputForm(
      {required String title,
      required TextEditingController controller,
      required String hinttext}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.robotoMono(fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: hinttext),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
