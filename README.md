# invoice_page_test_1

A new Flutter project to demonstrate issues with the Stripe CardField element in Web.

To run add a .env file to the root of the project. 
Insert the line STRIPE_KEY=<stripekey>

run: dart run build_runner build -d

Other option is to replace the Key.key value directly with your Stripe Key in main.dart and remove the env.dart file and the reference. 
