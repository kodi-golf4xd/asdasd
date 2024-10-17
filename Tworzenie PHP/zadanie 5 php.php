<?php
$polaczenie = new mysqli("localhost", "root", "", "zadanie_5");
if ($_SERVER["REQUEST_METHOD"] == "POST" && !empty($_POST['film_id'])) {
    $film_id = intval($_POST['film_id']);
    $polaczenie->query("DELETE FROM produkty WHERE id = $film_id");
}

function wyswietl_filmy($polaczenie, $warunek) {
    $wynik = $polaczenie->query("SELECT id, nazwa, opis, zdjecie FROM produkty WHERE $warunek");
    
    if ($wynik->num_rows > 0) {
        echo "<div class='film-container'>"; 
        while ($wiersz = $wynik->fetch_assoc()) {
            echo "<div class='film'>
                    <h4>{$wiersz['id']}. {$wiersz['nazwa']}</h4>
                    <img src='{$wiersz['zdjecie']}' alt='film'/>
                    <p>{$wiersz['opis']}</p></div>";
        }
        echo "</div>";
    } 
}
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>php zadanie_5</title>
    <link rel="stylesheet" href="css.css"> 
</head>
<body>
    <form method="POST">
        <label>Usuń film nr.: </label>
        <input type="number" name="film_id"> 
        <button type="submit">Usuń film</button>
    </form>

    <h2>Filmy o ID: 18, 22, 23, 25</h2>
    <?php 
    wyswietl_filmy($polaczenie, "id IN (18, 22, 23, 25)"); 
    ?>
    
    <h2>Filmy o Rodzaje_id = 12</h2>
    <?php 
    wyswietl_filmy($polaczenie, "Rodzaje_id = 12"); 
    $polaczenie->close(); 
    ?>
</body>
</html>
