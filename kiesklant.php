<?php include 'classes.php';?>
<?php include 'session.php';?>
<?php
// $session->winkelwagen->printPizzas();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $klantGevonden = false;
    $klanten = xpDb::getKlantByEmail($_POST['email']);
    foreach ($klanten as $klant) {
        // echo $klant["naam"];
        $klantGevonden = true;
        $session->winkelwagen->klant = new Klant($klant["klant_id"], $klant["klant_voornaam"], $klant["klant_tussenvoegsel"], $klant["klant_achternaam"]);
    }
    if ($klantGevonden) {
        header('Location: bestelling.php');
    }
    else {
        $foutboodschap = "klant komt niet voor";
    }
}
?>
<?php include 'head.php';?>
<?php include 'header.php';?>
<br><br><br><br>
<div id="sidebar" class="breed centreren">
    <h1>Aanmelden</h1>
    <p>Vul het e-mailadres in van het account waarmee je je wilt aanmelden.</p>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
        <input type="text" name="email">
        <br>
        <input value="Volgende" id="submit" type="submit"/>
    </form>
<!--    <p>Heb je geen account? Registreer je <a href="../../nieuwklant.php">nu.</a></p>-->
</div>
<br><br><br><br><br>
<?php include 'footer.php';?>
