<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Include librari phpmailer
include('phpmailer/Exception.php');
include('phpmailer/PHPMailer.php');
include('phpmailer/SMTP.php');

$email_pengirim = 'azharhrj@redtimer.xyz'; // Isikan dengan email pengirim
$nama_pengirim = 'Red Timer Roleplay'; // Isikan dengan nama pengirim
$email_penerima = $email; // Ambil email penerima dari inputan form
$nama_penerima = $user;
$subjek = 'RT:RP Account Activation'; // Ambil subjek dari inputan form
$pesan = "
    <p>To: <br>Username: <b>$user</b><br><br>
        Please click link in the below to activate your Red Timer RP Account:<br><br>
        <a href='http://ucp.redtimer.rf.gd/register?page=activation&t=$token'>
            http://ucp.redtimer.rf.gd/register?page=activation&t=$token
        </a><br><br>
        Best Regards,<br><br><i>RT:RP Management</i><br><br>
        <i style='text-align:center'>Copyright © Red Timer Roleplay 2021.</i>
    </p>
"; // Ambil pesan dari inputan form
// $attachment = $_FILES['attachment']['name']; // Ambil nama file yang di upload

$mail = new PHPMailer;
$mail->isSMTP();

$mail->Host = 'mail.redtimer.xyz';
$mail->Username = $email_pengirim; // Email Pengirim
$mail->Password = 'azharhrj17042006*&**'; // Isikan dengan Password email pengirim
$mail->Port = 465;
$mail->SMTPAuth = true;
$mail->SMTPSecure = 'ssl';
// $mail->SMTPDebug = 2; // Aktifkan untuk melakukan debugging

$mail->setFrom('azharhrj@redtimer.xyz', $nama_pengirim);
$mail->addAddress($email_penerima, $nama_penerima);
$mail->isHTML(true); // Aktifkan jika isi emailnya berupa html

$mail->Subject = $subjek;
$mail->Body = $pesan;
$sendMail = $mail->send();
if ($sendMail) {
    $sql = "UPDATE players SET token = '$token', email = '$email' WHERE username = '$user'";
    $query = $conn->db->prepare($sql);
    if ($query->execute()) {
      $response["status"] = 1;
      $response["message"] = 'Your account has been successfuly registered! Please check your email to activate your account.';
    }
} else {
    $response["status"] = 0;
    $response["message"] = 'Something went wrong, email activation not send! Please try again.';
}