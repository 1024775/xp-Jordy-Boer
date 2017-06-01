<?php include 'head.php';?>
<?php require 'conn.php';

$sql = "SELECT * FROM `pc` WHERE pc_soort = 'Home Theatre'";
$stmt = $conn->query($sql);
$stmt->execute();
?>
<style>
    .img-responsive{
        width: 100%!important;
        height: auto;
    }
</style>
<?php include 'header.php';?>
<br>
<br>
<div class="container">
    <div class="row">
        <?php while ($row = $stmt->fetch()) : ?>
            <div class="col-md-6">
                <div class="thumbnail">
                    <img class="img-responsive" src="<?php echo $row['pc_afbeelding']; ?>" alt="...">
                    <div class="caption">
                        <h3 class="pull-right">€<?php echo $row['pc_prijs']; ?></h3>
                        <h3><?php echo $row['pc_naam']; ?> </h3>
                        <p>
                            <?php echo $row['pc_omschrijving']; ?>
                        </p>
                        <p>
                            <a href="#" class="btn" role="button">Kopen</a>
                        </p>
                    </div>
                </div>
            </div>
        <?php endwhile; ?>
    </div>
</div><br>
<?php include 'footer.php';?>
