Moduł płatności internetowych - dotpay.pl

1. Importujemy do bazy zawartość pliku: dotpay-schema-mysql.sql
2. Skonfiguruj w pliku konfiguracyjnym swój id,PIN z dotpay.pl 
3. Przykład w example/payment.php
5. Zaaktualizuj w pliku konfiguracyjnym parametr returnAction na np 'payment/zaplacone'
6. Sprawdzanie płatności

$payment = ORM::factory('payment', 1);
$incomingPayments = $payment->incoming->find_all();

foreach ($incomingPayments as $k => $incomingPayment) {
    $stan = ($incomingPayment->status == 1) ? 'Zapłacone' : 'Brak płatności, lub coś nie tak';
    echo "$incomingPayment->email - $stan<br />";
}

