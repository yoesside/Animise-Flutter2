// ignore: unused_import
import 'package:animise_application/services/admin/order_service.dart';
import 'package:animise_application/theme/theme.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

class ContainerProcessReject extends StatelessWidget {

  int shippingId;

  ContainerProcessReject(this.shippingId);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 410,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 250,
        ),
        child: Row(
          children: [
            InkWell(
              onTap: (){
                var service = new OrderService(context);

                service.updateOrder(shippingId, 'process');
              },
              child: Image.asset("assets/Process.png",
                width: 52,
                height: 25,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: (){
                var service = new OrderService(context);

                service.updateOrder(shippingId, 'rejected');
              },
              child: Image.asset("assets/Reject.png",
                width: 52,
                height: 25,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
