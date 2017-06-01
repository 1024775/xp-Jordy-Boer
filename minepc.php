 <?php include 'session.php';?>
<?php include 'classes.php';?>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $session->winkelwagen = new Winkelwagen();
        $pc_id = $_POST['pc_id'];
        //echo "pc =" . $pc_id;
        $pcs = xpDb::getPcByID($pc_id);
        foreach ($pcs as $pc) {
            $pcclass = new Pc($pc["pc_id"], $pc["pc_naam"], $pc["pc_omschrijving"], $pc["pc_prijs"]);
            $session->winkelwagen->addPc($pcclass);
            header('Location: kiesklant.php');
        }
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="Cyber, Cybersecurity, Security, Hacking, Veiligheid, Internet, Online, Beveiliging">
    <meta name="description" content="Helpt organisaties bestendiger te maken tegen cyber dreigingen">
    <meta name="author" content="Lion Siek, Valentino Trok">
    <link href="https://fonts.googleapis.com/css?family=Expletus+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Passion+One" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="icon" href="../images/logo.png">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>Diensten</title>
</head>
<?php require 'conn.php';

$sql = "SELECT * FROM `pc` WHERE pc_soort = 'Mining Rig'";
$stmt = $conn->query($sql);
$stmt->execute();
?>
<body>

<h2 style="margin-bottom: 30px;"><a href="index.php" id="headingHackware">ID<span style="color: red">Custom</span>Hardware</a>
</h2>

<?php include 'header.php';?>
<br>
<br>
<div class="container">
    <div class="row">
        <?php while ($row = $stmt->fetch()) : ?>
            <div class="col-md-6">
                <div class="thumbnail">
                    <img src="<?php echo $row['pc_afbeelding']; ?>" alt="...">
                    <div class="caption">
                        <h3 class="pull-right">€<?php echo $row['pc_prijs']; ?></h3>
                        <h3><?php echo $row['pc_naam']; ?> </h3>
                        <p>
                            <?php echo $row['pc_omschrijving']; ?>
                        </p>
                        <p>
                            <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">

                                <input type='hidden' name='pc_id' value='<?php echo $row["pc_id"]; ?>'>

                                <input class="btn" value="Kopen" id="submit" type="submit"/>
                            </form>
                        </p>
                    </div>
                </div>
            </div>
        <?php endwhile; ?>
    </div>
</div>
<br>
<?php include 'footer.php';?>
