import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'dart:convert';

class PaymentHelper extends GetxController{
  Map<String,dynamic>? paymentIntentData;


  calculateAmount(String amount){
    final  a = int.parse(amount);
    return a.toString();
  }


  createPayment(String amount , String currency) async{
      try{
        Map<String,dynamic> body = {
          'amount':calculateAmount(amount),
          'currency':currency,
          'payment_method_type[]':'card'
        };
        Map<String,String> header = {
          'Authorization': "Bearer sk_test_51GQ8hTDVXOXIy9Uxm4xNL9B8TNe81JqkYxwM7is0MerO0x6UOaJJtqyCI9TBTG2CaTj5hIEx7TJpgc19OIj0YXPY00jMNVWtm8",
          'Content-Type':'application/x-www-form-urlencoded'
        };
        var response = await http.post(Uri(path:'api.stripe.com/v2/payements_intents'),headers:header,body:body);
        print(response.body);
        jsonDecode(response.body);


      } catch(e){
        print("erreur : $e");

      }
  }


  Future<void>makePayement({required BuildContext context, required String amount, required String currency}) async {
      try {
        paymentIntentData = await createPayment(amount, currency);
        if(paymentIntentData != null){
          await Stripe.instance.initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                applePay: PaymentSheetApplePay(merchantCountryCode: 'EUR'),
                googlePay: PaymentSheetGooglePay(merchantCountryCode: 'EUR'),
                merchantDisplayName: 'AmazonMini'
              )

          );
          await display();
        }

      }
      catch(e,s){
        print("afficher les exceptions : $e $s");
      }

  }

  display() async {
    try{
      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch(e){
      print("erreur lors de l'affichage");
    }
  }

}