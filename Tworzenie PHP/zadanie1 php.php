<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>PHP zadanie1</title>
</head>
<body>
    <h2>Towary objęte promocją</h2>
    <?php
    $connect = new mysqli("localhost", "root", "", "zadanie_1");
    $wynik = $connect->query("SELECT nazwa FROM towary WHERE promocja = 1");
    if ($wynik->num_rows > 0) {
        echo "<ol type='a'>";
        while ($wiersz = $wynik->fetch_assoc()) {
            echo "<li>{$wiersz['nazwa']}</li>";
        }
        echo "</ol>";
    }
    ?>

    <h2>Sprawdź cenę towaru</h2>
    <form method="post">
        <select name="towar">
            <option value="Gumka do mazania">Gumka do mazania</option>
            <option value="Cienkopis">Cienkopis</option>
            <option value="Pisaki 60 szt.">Pisaki 60 szt</option>
            <option value="Markery 4 szt.">Markery 4 szt</option>
        </select>
        <br><br>
        <input type="submit" value="SPRAWDŹ">
    </form>
    <?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $towar = $_POST['towar'];
    $wynik = $connect->query("SELECT cena FROM towary WHERE nazwa = '$towar'");
  
    if ($wiersz = $wynik->fetch_assoc()) {
        $cenaregularna = $wiersz["cena"];
        $cenapromocyjna = $cenaregularna * 0.7;
        echo "Cena regularna: " . number_format($cenaregularna, 2) . " zł<br>";
        echo "Cena po 30% zniżce: " . number_format($cenapromocyjna, 2) . " zł";
    } }
$connect->close();
?>
</body>
</html>