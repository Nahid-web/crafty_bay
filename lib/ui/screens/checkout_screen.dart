import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/create_invoice_controller.dart';
import 'package:crafty_bay/ui/screens/payment_webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CreateInvoiceController>().getInvoice();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: GetBuilder<CreateInvoiceController>(
          builder: (createInvoiceController) {
        if (createInvoiceController.inProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final invoiceWrapper =
            createInvoiceController.paymentMethodListModel.data?.first;
        return SingleChildScrollView(
          child: Column(
            children: [
              Text('Payable : ${invoiceWrapper?.payable}',style: Theme.of(context).textTheme.titleMedium,),
              Text('Vat : ${invoiceWrapper?.vat}' , style: Theme.of(context).textTheme.titleMedium,),
              Text('Total : ${invoiceWrapper?.total}', style: Theme.of(context).textTheme.titleMedium,),
              ListView.separated(
                itemCount: invoiceWrapper!.paymentMethod?.length ?? 0,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  final paymentMethod = invoiceWrapper.paymentMethod![index];
                  return ListTile(
                    onTap: (){
                      Get.to(()=> PaymentWebViewScreen(url: paymentMethod.redirectGatewayURL!));
                    },
                    leading: Image.network(paymentMethod.logo.toString()),
                    title: Text(paymentMethod.name.toString()),
                    trailing: const Icon(Icons.arrow_right_alt_outlined),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              )
            ],
          ),
        );
      }),
    );
  }
}
