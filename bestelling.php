<?php include 'classes.php';?>
<?php include 'session.php';?>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // sla de bestelling op
    $session->winkelwagen->saveToDatabase();
    unset($session->winkelwagen);
    header('Location: Bedankt.php');
}
?>
<?php include 'head.php';?>
<?php include 'header.php';?>

<br><br><br>

<div id="sidebar" class="breed">
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
     <h3>Uw gegevens</h3>
    <?php
//    $klanten = xpDb::getKlantByID($session->winkelwagen->klantID);
        echo "<label>Voornaam</label> " . $session->winkelwagen->klant->voornaam . "<br>";
        echo "<label>Tussenvoegsel</label> " . $session->winkelwagen->klant->tussenvoegsel . "<br>";
        echo "<label>Achternaam</label> " . $session->winkelwagen->klant->achternaam . "<br>";

//        echo "<label>Email</label>" . $klant["email"] . "<br>";
//        echo "<label>Telefoon</label>" . $klant["telefoon"] . "<br>";
//        echo "<label>Adres</label>" . $klant["adres"] . "<br>";
//        echo "<label>Postcode</label>" . $klant["postcode"] . "<br>";
//        echo "<label>Woonplaats</label>" . $klant["woonplaats"] . "<br>";
    ?>
    <br>






        <h3>Uw bestelling</h3>
    <table>
        <tr>
            <th><label>Pc</label></th>
            <th><label>Omschrijving</label></th>
            <th><label>Prijs</label></th>
        </tr>
        <?php
            $totaalPrijs = 0;
                foreach ($session->winkelwagen->pcs as $pc) {
            echo "<tr>";
            echo "<td>";
            echo $pc->naam;
            echo "</td>";
            echo "<td>";
            echo $pc->omschrijving;
            echo "</td>";
            echo "<td>";
            $pcPrijs = $pc->prijs;
            $totaalPrijs = $totaalPrijs + $pcPrijs;
            echo number_format($pcPrijs, 2);
            echo "</td>";
            echo "</tr>";
        }
        ?>
            <tr>
                <td></td>
                <td></td>
                <td class="prijs totaalPrijs"><?php echo number_format($totaalPrijs, 2) ?></td>
            </tr>
    </table>

    <br>
    <input value="Bestel" class="rechts" id="submit" type="submit"/>
    </form>
</div>
<br><br><br><br>
<?php include 'footer.php';?>

