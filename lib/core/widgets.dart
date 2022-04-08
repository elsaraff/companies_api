import 'package:companies_management_app/models/companies_model.dart';
import 'package:flutter/material.dart';

Widget customAppBar({required Size size, required BuildContext context}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    height: size.height * .2,
    child: Stack(
      children: [
        Container(
          height: size.height * 0.2 - 20,
          width: size.width,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                Text('Home',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Icon(
                  Icons.more_vert_sharp,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 55,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: Theme.of(context).primaryColor.withOpacity(0.23),
                  )
                ]),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5)),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget companyItem(CompaniesList company) {
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(
            company.companyImageUrl,
          ),
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        flex: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(company.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(company.company,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, color: Colors.grey[500])),
          ],
        ),
      ),
      const Spacer(),
      Expanded(
        flex: 1,
        child: company.verified
            ? Stack(
                alignment: AlignmentDirectional.center,
                children: const [
                  CircleAvatar(radius: 15, backgroundColor: Colors.green),
                  Text('active',
                      style: TextStyle(color: Colors.white, fontSize: 8)),
                ],
              )
            : Stack(
                alignment: AlignmentDirectional.center,
                children: const [
                  CircleAvatar(radius: 15, backgroundColor: Colors.red),
                  Text('banned',
                      style: TextStyle(color: Colors.white, fontSize: 8)),
                ],
              ),
      ),
    ],
  );
}

Widget myDivider() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      color: Colors.grey,
      height: 2,
    ),
  );
}
