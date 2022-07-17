import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/model/Customer/customer.dart';
import 'package:ichinsan_mobile/model/Project/projectdetail.dart';

import '../../constants/Theme.dart';
import '../../constants/common.dart';
import '../../model/Project/projects.dart';
import '../../utils/network.dart';
import '../../widgets/home_widget/titletext.dart';

class CustomerDetail extends StatefulWidget {
  const CustomerDetail({Key? key, required this.customerID, required this.customername}) : super(key: key);
  final String customerID;
  final String customername;

  @override
  State<CustomerDetail> createState() => CustomerDetailState();
}

class CustomerDetailState extends State<CustomerDetail> {
  Customer customer= Customer();

  List<ProjectList> projectlist = <ProjectList>[];

  @override
  void initState() {
    super.initState();
    getCustomerbyId(widget.customerID).then((value) {
      setState(() {
        customer=value!;
        projectlist=customer.projectList!;
      });
    });
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: BackButton(
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(widget.customername),
            bottom: TabBar(
              tabs: [Tab(text: 'Project'), Tab(text: 'About')],
            ),
          ),
          body: TabBarView(
            children: [
              //----------------------Tab Project-----------------
              SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: projectlist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return list_items(index);
                        }),
                    //list_items(1),
                  ],
                ),
              ),
              //---------------------Tab About------------------
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Row(
                        children: [
                          Text("Name ",
                              style: TextStyle(
                                  color: NowUIColors.text,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold)),
                          Text(widget.customername.toString(),
                              style: TextStyle(
                                color: NowUIColors.info,
                                fontSize: 24,)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        child: Container(
                          child: Row(
                            children: [
                              Text("Email: ",
                                  style: const TextStyle(
                                      color: NowUIColors.text,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold)),
                              Expanded(
                                child: Text(customer.email.toString(),
                                    style: const TextStyle(
                                      color: NowUIColors.info,
                                      fontSize: 24,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  list_items(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 220,
        constraints: const BoxConstraints(maxHeight: 800),
        child: Card(
          elevation: 3,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                      width: 250,
                            child: Text(projectlist[index].projectName.toString(),
                                style: TextStyle(
                                    color: NowUIColors.primary,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    Text(projectlist[index].status.toString(),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: NowUIColors.info,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                Text("Category: "+ projectlist[index].projectCategoryName.toString(),
                    style: TextStyle(
                        color: NowUIColors.info,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Translator: "+projectlist[index].currentTranslatorNumber.toString()+"/"+projectlist[index].totalTranslator.toString(),
                    style: TextStyle(
                        //color: NowUIColors.info,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Summary:",
                    style: TextStyle(
                        //color: NowUIColors.info,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Expanded(
                  child: SizedBox(
                    height: 90,
                    child: Text(projectlist[index].description.toString(),
                        overflow: TextOverflow.clip,
                        maxLines: 3,
                        style:
                            TextStyle(color: NowUIColors.text, fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
