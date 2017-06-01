<?php
/**
 *   Class that handles all communication with the database
 */
class xpDb  {
    const servername = "localhost";
    const username = "root";
    const password = "";
    const dbname = "xp";

    public static function getPcByID($pc_id) {
        $sql = "SELECT `pc_id`, `pc_naam`, `pc_omschrijving`, `pc_soort`, `pc_prijs` FROM `pc` WHERE `pc_id` = " . $pc_id . " ";
        return xpDb::getxpDb($sql);

    }
    public static function getOnderdelenByID($ond_id){
        $sql = "SELECT `ond_id`, `ond_soort`, `ond_naam`, `ond_socket`, `ond_prijs` FROM `onderdelen` WHERE `ond_id` = " . $ond_id . " ";
        return xpDb::getxpDb($sql);
    }

    public static function slaBestellingOp($conn, $klant_id, $pc_id) {
        $conn->exec("insert into bestellingen(klant_id, pc_id) values (" . $klant_id . "," . $pc_id . ")");
        return $conn->lastInsertId();
    }

    /**
     *    Method for getting a customer by e-mail address
     *
     *    @param    email     email address of a customer
     *    @return   array
     **/
    public static function getKlantByEmail($email) {
        $sql = "SELECT `klant_id`, `klant_voornaam`, `klant_tussenvoegsel`, `klant_achternaam`, `klant_email`, `klant_telefoon`, `klant_adres`, `klant_postcode`, `klant_woonplaats` FROM `klant` WHERE klant_email = '" . $email . "' ";
        return xpDb::getxpDb($sql);
    }

    public static function getKlantByID($ID_klant) {
        $sql = "SELECT `klant_id`, `klant_voornaam`, `klant_tussenvoegsel`, `klant_achternaam`, `klant_email`, `klant_telefoon`, `klant_adres`, `klant_postcode`, `klant_woonplaats` FROM `klant` WHERE klant_id = " . $ID_klant . " ";
        return xpDb::getxpDb($sql);
    }

    public static function saveKlant($ID_klant, $voornaam, $tussenvoegsel, $achternaam, $email, $telefoon, $adres, $postcode, $woonplaats) {
        $sql = "UPDATE klant SET klant_voornaam = '" . $voornaam . "', klant_tussenvoegsel = '" . $tussenvoegsel . "', klant_achternaam = '" . $achternaam . "', klant_telefoon = '" . $telefoon . "', klant_email = '" . $email . "', klant_adres = '" . $adres . "', klant_postcode = '" . $postcode . "', klant_woonplaats = '" . $woonplaats . " WHERE ID_klant = " . $ID_klant . " ";
        return xpDb::getxpDb($sql);
    }


    /**
     *    General method for getting information from the database
     *
     *    @param    sql     sql statement for fetching the data
     *    @return   array
     **/
    private static function getxpDb($sql) {
        $result = array();

        try {
            $conn = self::getConnection();
            $result = $conn->query($sql);
            $conn = null;
        }
        catch (PDOexception $e) {
            echo "Error is: " . $e-> etmessage();
        }
        return $result;
    }

    public static function getConnection() {
        try {
            $conn = new PDO("mysql:host=" . xpDb::servername . ";dbname=" . xpDb::dbname, xpDb::username, xpDb::password);
            var_dump($conn);
            return $conn;
        }
        catch (PDOexception $e) {
            echo "Error is: " . $e->etmessage();
        }
    }

    public static function slaKlantOp($voornaam, $tussenvoegsel, $achternaam, $email, $telefoon, $adres, $postcode, $woonplaats) {
        try {
            $conn = xpDb::getConnection();
            $conn->beginTransaction();
            $conn->exec("INSERT INTO `klant`(`klant_voornaam`, `klant_tussenvoegsel`, `klant_achternaam`, `klant_email`, `klant_telefoon`, `klant_adres`, `klant_postcode`, `klant_woonplaats`) VALUES ('" . $voornaam . "','" . $tussenvoegsel . "','" . $achternaam . "','" . $email . "','" . $telefoon . "', '" . $adres . "','" . $postcode . "','" . $woonplaats . "') ");
            $klantID = $conn->lastInsertId();
            $conn->commit();
            $conn = null;
            return $klantID;
        }
        catch (Exception $e) {
            $conn->rollBack();
            echo "Failed: " . $e->getMessage();
        }
    }

}
class Pc
{
    public $pc_ID;
    public $naam;
    public $omschrijving;
    public $prijs;

    /**
     *    Constructor for the pizza class
     *
     * @param    soortID     id of the pizza kind in the datebase
     * @param    typeID      id of the pizza size in the database
     * @param    aantal      number of pizza of this kind that will be ordered
     * @return   void
     **/
    public function __construct($pc_ID, $naam, $omschrijving, $prijs)
    {
        $this->pc_ID = $pc_ID;
        $this->naam = $naam;
        $this->omschrijving = $omschrijving;
        $this->prijs = $prijs;
    }
}

class Klant {

    public $klant_id;
    public $voornaam;
    public $tussenvoegsel;
    public $achternaam;

    public function __construct($klant_id, $voornaam, $tussenvoegsel, $achternaam)
    {
        $this->klant_id = $klant_id;
        $this->voornaam = $voornaam;
        $this->tussenvoegsel = $tussenvoegsel;
        $this->achternaam = $achternaam;
    }
}
/**
 *   Placeholder for storing all data related to a pc order
 */
class Winkelwagen
{
    public $klant;
    public $pcs = array();

    public function addPc($pc){
        array_push($this->pcs, $pc);
    }

    public function printwinkelwagen()
    {
        foreach ($this->pcs as $pc) {
            echo "naam = " . $pc->naam . "; omschrijving = " . $pc->omschrijving . "; prijs = " . $pc->prijs . ";<br>";
        }
        if (isset($this->klant)) {
            echo "achternaam:" . $this->klant->achternaam . "<br>";
        }
    }

    public function saveToDatabase() {
        try {
            $conn = xpDb::getConnection();
            $conn->beginTransaction();
            // Sla de bestelling op
            $bestellingID = xpDb::slaBestellingOp($conn, $this->klant->klant_id, $this->pcs[0]->pc_ID);
            $conn->commit();
            $conn = null;
        }
        catch (Exception $e) {
            $conn->rollBack();
            echo "Failed: " . $e->getMessage();
        }
    }

}

?>

