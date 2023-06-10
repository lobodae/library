<?php
session_start();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Połączenie z bazą danych
    $conn = new mysqli("localhost", "root", "", "library");

    // Sprawdzenie połączenia
    if ($conn->connect_error) {
        die("Błąd połączenia: " . $conn->connect_error);
    }

    // Zapytanie SQL do sprawdzenia loginu i hasła
    $sql = "SELECT * FROM users WHERE username='$username' AND password='$password'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        // Ustawienie zmiennej sesyjnej dla zalogowanego użytkownika
        $_SESSION["username"] = $username;
        
        // Przekierowanie do strony domowej biblioteki
        header("Location: library.php");
    } else {
        // Błąd logowania
        echo "Nieprawidłowy login lub hasło.";
    }

    $conn->close();
}
?>