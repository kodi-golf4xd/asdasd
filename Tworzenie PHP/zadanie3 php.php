<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>PHP zadanie3</title>
</head>
<body>
    <?php
    $polaczenie = new mysqli("localhost", "root", "", "zadanie_3");
    $wynik = $polaczenie->query("SELECT imie, nazwisko FROM uczen WHERE id = 2");
    if ($wiersz = $wynik->fetch_assoc()) {
        echo "<h2>Uczeń: {$wiersz['imie']} {$wiersz['nazwisko']}</h2>";
    } 

    $kwerenda = "SELECT AVG(ocena.ocena) AS srednia FROM ocena JOIN przedmiot ON ocena.przedmiot_id = przedmiot.id WHERE ocena.uczen_id = 2 AND przedmiot.nazwa = 'język polski'";
    $wynik = $polaczenie->query($kwerenda);
    if ($wiersz = $wynik->fetch_assoc()) {
        echo "<p>Średnia ocen z języka polskiego: " . number_format($wiersz['srednia'], 2) . "</p>";
    } 
    $polaczenie->close();
    ?>
</body>
</html>
