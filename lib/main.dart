import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:intl/intl.dart';
import 'package:invoice_page_test_1/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SemanticsBinding.instance.ensureSemantics();
  await setupStripe(stripeKey: Env.key);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Invoice Page'),
            ),
            body: InvoicePage()));
  }
}

class InvoicePage extends ConsumerStatefulWidget {
  const InvoicePage({
    super.key,
  });
  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends ConsumerState<InvoicePage> {
  CardFieldInputDetails? _cardData;
  final oCcy = NumberFormat.simpleCurrency();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Invoice'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 500,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Charge Total: ${oCcy.format(597.32)}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        CardField(
                          //countryCode: 'CA',
                          onCardChanged: (card) {
                            setState(() {
                              _cardData = card;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () => {},
                          child: Text('Charge'),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

Future<void> setupStripe({required stripeKey}) async {
  Stripe.publishableKey = stripeKey;
  await Stripe.instance.applySettings();
}
