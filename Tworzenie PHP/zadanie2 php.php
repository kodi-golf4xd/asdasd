<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>PHP Zadanie 2</title>
</head>
<body>
    <?php
    $connect = new mysqli("localhost", "root", "", "zadanie_2");
    $wynik = $connect->query("SELECT nazwa, cena FROM towary LIMIT 4");
    ?>

    <form method="post">
      Wybierz artykuł: 
        <select name="towar" id="towar">
            <option value="Zeszyt 60 kartek">Zeszyt 60 kartek</option>
            <option value="Zeszyt 32 kartki">Zeszyt 32 kartki</option>
            <option value="Cyrkiel">Cyrkiel</option>
            <option value="Linijka 30 cm">Linijka 30 cm</option>
        </select>
        <br><br>
       Liczba sztuk:
        <input type="number" name="liczba" id="liczba">
        <br><br>
        <input type="submit" value="OBLICZ">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $towar = $_POST['towar'];
        $liczba = $_POST['liczba'];
        $wynik = $connect->query("SELECT cena FROM towary WHERE nazwa = '$towar'");
        
        if ($wiersz = $wynik->fetch_assoc()) {
            $cena = $wiersz["cena"];
            $wartoscZakupow = $cena * $liczba;
            echo "Wartość zakupów: " . number_format($wartoscZakupow, 2) . " zł";
        } 
    }
    $connect->close();
    ?>
</body>
</html>
