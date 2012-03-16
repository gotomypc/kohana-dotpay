<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Frontend_Payment extends Controller_Frontend_Template {
        
        public function action_addPayment() {
            $payment = ORM::factory('payment');
            $payment->name          = 'Premium - 1 miesiąc';
            $payment->description   = 'Pakiet premium na okres 1 miesiąca';
            $payment->amount        = (float) 10; 
            $payment->control       = md5($payment->name);
            $payment->save();
            
            $payment = ORM::factory('payment');
            $payment->name          = 'Premium - 3 miesiące';
            $payment->description   = 'Pakiet premium na okres 3 miesięcy';
            $payment->amount        = (float) 30; 
            $payment->control       = md5($payment->name);
            $payment->save();
            
            $payment = ORM::factory('payment');
            $payment->name          = 'Premium - 12 miesięcy';
            $payment->description   = 'Pakiet premium na okres 12 miesięcy';
            $payment->amount        = (float) 120; 
            $payment->control       = md5($payment->name);
            $payment->save();
        }
        
        public function action_innaPlatnosc() {
            $dotpay = Dotpay::instance();
            
            $payment = array(
                'id'                => 0,
                'amount'            => 12321.12,
                'description'       => 'Pzłatność za usługę',
                'control'           => 'sd123421321313213',
            );
            $email = 'kiki.diavo@gmail.com'; // Client email
            $this->template->content = $dotpay->pay($payment, $email);
        }
        
        public function action_zaplacone() {
            $this->template->content = Dotpay::instance()->afterPay();
        }
        
        public function action_premium1mc() {
            $payment = ORM::factory('payment', 1); // Płatność - Premium 1 MC
            $this->template->content = Dotpay::instance()->pay($payment, 'adres@email.pl');
        }

        public function action_premium3mc() {
            $payment = ORM::factory('payment', 2); // Płatność - Premium 3 MC
            $this->template->content = Dotpay::instance()->pay($payment, 'adres@email.pl');
        }

        public function action_premium12mc() {
            $payment = ORM::factory('payment', 3); // Płatność - Premium 12 MC
            $this->template->content = Dotpay::instance()->pay($payment, 'adres@email.pl');
        }
}
