s<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Include librari phpmailer
include('phpmailer/Exception.php');
include('phpmailer/PHPMailer.php');
include('phpmailer/SMTP.php');

$email_pengirim = 'ucp@redtimer.xyz'; // Isikan dengan email pengirim
$nama_pengirim = 'Red Timer Roleplay'; // Isikan dengan nama pengirim
$email_penerima = $email; // Ambil email penerima dari inputan form
$nama_penerima = $username;
$subjek = 'RT:RP Reset Password'; // Ambil subjek dari inputan form
$pesan = "
    <p>To: <br>Username: <b>$username</b><br><br>
        Please click link in the below to reset your password:<br><br>
        <a href='https://ucp.redtimer.xyz/forgot?page=pass&c=$kode'>
            https://ucp.redtimer.xyz/forgot?page=pass&c=$kode
        </a><br><br>
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
    $sql = $conn->db->prepare("UPDATE players SET kode = '$kode' WHERE username = '$username' AND email = '$email'");
    $sql->execute();
    $response["status"] = 1;
    $response["message"] = 'Request reset password has been send! Please check your email to reset your password.';
} else {
    $response["status"] = 0;
    $response["message"] = 'Something went wrong, email reset password not send! Please try again.';
}