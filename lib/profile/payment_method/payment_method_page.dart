import 'components/new_card_row.dart';
import 'components/default_card.dart';
import 'package:flutter/material.dart';
import 'components/payment_option_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:final_project/profile/payment_method/cubit/card_cubit.dart';
import 'package:final_project/presentation/forget_Password/app_back_button.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(
          'Payment Option',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff04658e),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            BlocBuilder<CardCubit, CardState>(
              builder: (context, state) {
                return Column(
                  children: [
                    state.cardNumber.isNotEmpty
                        ? CreditCardWidget(
                            cardNumber: state.cardNumber,
                            expiryDate: state.expireDate,
                            cardHolderName: state.holderName,
                            cvvCode: state.cvv,
                            showBackView: false,
                            isHolderNameVisible: true,
                            isChipVisible: false,
                            backgroundImage:
                                'assets/images/payment/paymentimage.png',
                            cardType: CardType.visa,
                            onCreditCardWidgetChange: (v) {},
                          )
                        : const AddNewCardRow(),
                  ],
                );
              },
            ),
            const PaymentDefaultCard(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Other Payment Options',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
              ),
            ),
            PaymentOptionTile(
              image: 'assets/images/payment/payment1.png',
              label: 'Paypal',
              accountName: 'Magedmetry@gmail.com',
              onTap: () {},
            ),
            PaymentOptionTile(
              image: 'assets/images/payment/payment2.png',
              label: 'Cash on Delivery',
              accountName: 'Pay in Cash',
              onTap: () {},
            ),
            PaymentOptionTile(
              image: 'assets/images/payment/payment3.png',
              label: 'Apple Pay',
              accountName: 'applepay.com',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
