<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Include librari phpmailer
include('phpmailer/Exception.php');
include('phpmailer/PHPMailer.php');
include('phpmailer/SMTP.php');

$email_pengirim = 'ucp@redtimer.xyz'; // Isikan dengan email pengirim
$nama_pengirim = 'Red Timer Roleplay'; // Isikan dengan nama pengirim
$email_penerima = $mailer; // Ambil email penerima dari inputan form
$nama_penerima = $data["username"];
$subjek = 'RT:RP Forgot Username'; // Ambil subjek dari inputan form
$pesan = "
    <p>To: <br>Email: <b>$mailer</b><br><br>
        Your account username is: <b>$nama_penerima</b><br><br>
        Best Regards,<br><br><br><i>RT:RP Management</i><br><br>
        <i style='text-align:center'>Copyright © Red Timer Roleplay 2021.</i>
    </p>
"; // Ambil pesan dari inputan form
// $attachment = $_FILES['attachment']['name']; // Ambil nama file yang di upload

$mail = new PHPMailer;
$mail->isSMTP();

$mail->Host = 'localhost';
$mail->Username = $email_pengirim; // Email Pengirim
$mail->Password = ''; // Isikan dengan Password email pengirim
$mail->Port = 465;
$mail->SMTPAuth = true;
$mail->SMTPSecure = 'ssl';
// $mail->SMTPDebug = 2; // Aktifkan untuk melakukan debugging

$mail->setFrom('ucp@redtimer.xyz', $nama_pengirim);
$mail->addAddress($email_penerima, $nama_penerima);
$mail->isHTML(true); // Aktifkan jika isi emailnya berupa html

$mail->Subject = $subjek;
$mail->Body = $pesan;
$sendMail = $mail->send();
if ($sendMail) {
    $response["status"] = 1;
    $response["message"] = 'Request forgot username has been send! Please check your email.';
} else {
    $response["status"] = 0;
    $response["message"] = 'Something went wrong, email forgot username not send! Please try again.';
}