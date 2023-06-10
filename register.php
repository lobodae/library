<?php
    $success=0;


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $email = $_POST["email"];
    $password = $_POST["password"];



    // Połączenie z bazą danych
    $conn = new mysqli("localhost", "root", "", "library");

    // Sprawdzenie połączenia
    if ($conn->connect_error) {
        die("Błąd połączenia: " . $conn->connect_error);
    }

    // Zapytanie SQL do sprawdzenia istnienia użytkownika
    $checkUserQuery = "SELECT * FROM users WHERE username='$username'";
    $checkUserResult = $conn->query($checkUserQuery);

    //zapytanie SQL do sprawdzenie czy już jest taki email w bazie
    $checkUserEmailQuery = "SELECT * FROM users WHERE email='$email'";
    $checkUserEmailResult = $conn->query($checkUserEmailQuery);

    if ($checkUserResult->num_rows > 0) {
        // Nazwa użytkownika jest już zajęta
        echo "Nazwa użytkownika jest już zajęta.";
    } else if ($checkUserEmailResult->num_rows > 0)
    {
            // Nazwa użytkownika jest już zajęta
            echo "Ten email już istnieje w bazie.";

    }else if(!preg_match('/^(?=.*[a-z])(?=[A-Z])(?=.*\d)(?=.*[^\w\d\s])\S{3,}$/', $_POST["password"]))
    {
        //walidacja hasla, male litery, duze litery, 1 cyfra,jeden znak specjalny, min 3 znaki
             {
                echo "Haslo nie spelnia wymagan";
            }
        }else {
            //hashowanie hasla
            $pass = password_hash('$_POST["password"]', PASSWORD_ARGON2ID);

            // Zapytanie SQL do dodania nowego użytkownika
            $insertUserQuery = "INSERT INTO users (username, email, password) VALUES ('$username', '$email', '$pass')";
        

            if ($conn->query($insertUserQuery) === TRUE) {
                // Rejestracja udana
                //echo "Rejestracja udana.";
                // $alert = "<script>alert('Dodano użytkownika');</script>";
                // echo $alert;
                header(("location: index.html"));
                exit();


            }else{
                // Błąd rejestracji
                echo "Błąd rejestracji: " . $conn->error;
            }

    }

}
    
    $conn->close();
?>