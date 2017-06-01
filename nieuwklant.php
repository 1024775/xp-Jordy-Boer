<?php include 'classes.php'; ?>
<?php include 'head.php';?>
<?php include 'header.php';?>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (strlen($_POST['voornaam']) > 0 and strlen($_POST['Achternaam']) > 0 and strlen($_POST['email']) > 0 and strlen($_POST['telefoon']) > 0 and strlen($_POST['adres']) > 0 and strlen($_POST['postcode']) > 0 and strlen($_POST['woonplaats']) > 0) {
        $klantID = xpDb::slaKlantOp($_POST['voornaam'], $_POST['tussenvoegsel'], $_POST['Achternaam'], $_POST['email'], $_POST['telefoon'], $_POST['adres'], $_POST['postcode'], $_POST['woonplaats']);
        //$session->winkelwagen->klantID = $klantID;
        header('Location: index.php');
    } else {
        // $foutboodschap = "Vul alle velden in";
    }
}
?>
    <link href="//db.onlinewebfonts.com/c/a4e256ed67403c6ad5d43937ed48a77b?family=Core+Sans+N+W01+35+Light"
          rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/form.css" type="text/css">
    <div class="body-content">
        <div class="module">
            <h1 id="yes">Creëer uw account</h1>
            <div id="sidebar" class="breed centreren">
                <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
                    <label>Voornaam</label><br>
                    <input type="text" name="voornaam" placeholder="Type hier uw voornaam.."><br>
                    <label>Tussenvoegsel</label><br>
                    <input type="text" name="tussenvoegsel" placeholder="Type hier uw tussenvoegsel.."><br>
                    <label>Achternaam</label><br>
                    <input type="text" name="Achternaam" placeholder="Type hier uw achternaam.."><br>
                    <label>E-mail</label><br>
                    <input type="text" name="email" placeholder="Type hier uw E-mail.."><br>
                    <label>Telefoon</label><br>
                    <input type="text" name="telefoon" placeholder="Type hier uw telefoonnummer.."><br>
                    <label>Adres</label><br>
                    <input type="text" name="adres" placeholder="Type hier uw adres.."><br>
                    <label>Postcode</label><br>
                    <input type="text" name="postcode" placeholder="Type hier uw postcode.."><br>
                    <label>woonplaats</label><br>
                    <input type="text" name="woonplaats" placeholder="Type hier uw woonplaats.."><br>
                    <br>
                    <input class="myButton" value="Registreer" id="submit" type="submit"/>
                </form>
            </div>
        </div>
    </div>

