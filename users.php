<?php
session_start();

// Sprawdzenie, czy użytkownik jest zalogowany
if (!isset($_SESSION["username"])) {
    header("Location: index.html");
    exit();
}

// Wylogowanie użytkownika
if (isset($_GET["logout"])) {
    session_destroy();
    header("Location: index.html");
    exit();
}

// Połączenie z bazą danych
$conn = new mysqli("localhost", "root", "", "library");

// Sprawdzenie połączenia
if ($conn->connect_error) {
    die("Błąd połączenia: " . $conn->connect_error);
}

// Usunięcie książki
if (isset($_GET["delete"])) {
    $bookId = $_GET["delete"];

    $deleteQuery = "DELETE FROM users WHERE id=$bookId";
    if ($conn->query($deleteQuery) === TRUE) {
        header("Location: library.php");
        exit();
    } else {
        echo "Błąd podczas usuwania książki: " . $conn->error;
    }
}

// Edycja książki
if (isset($_POST["edit"])) {
    $bookId = $_POST["book-id"];
    $newAuthor = $_POST["new-author"];
    $newTitle = $_POST["new-title"];
    $newCategory = $_POST["new-category"];
    $newNr_polki = $_POST["new-nr_polki"];
    $newNr_regal = $_POST["new-nr_regal"];
    $newAlphabet = $_POST["new-alphabet"];

    $updateQuery = "UPDATE users SET ";

    if (!empty($newAuthor)) {
        $updateQuery .= "author='$newAuthor', ";
    }
    if (!empty($newTitle)) {
        $updateQuery .= "title='$newTitle', ";
    }
    if (!empty($newCategory)) {
        $updateQuery .= "category='$newCategory', ";
    }
    if (!empty($newNr_polki)) {
        $updateQuery .= "nr_polki='$newNr_polki', ";
    }
    if (!empty($newNr_regal)) {
        $updateQuery .= "nr_regal='$newNr_regal', ";
    }
    if (!empty($newAlphabet)) {
        $updateQuery .= "alphabet='$newAlphabet', ";
    }

    $updateQuery = rtrim($updateQuery, ", ");
    $updateQuery .= " WHERE id=$bookId";

    if ($conn->query($updateQuery) === TRUE) {
        header("Location: library.php");
        exit();
    } else {
        echo "Błąd podczas edycji książki: " . $conn->error;
    }
}

// Dodawanie nowej książki
if (isset($_POST["submit"])) {
    $title = $_POST["title"];
    $author = $_POST["author"];
    $category = $_POST["category"];
    $nr_polki = $_POST["nr_polki"];
    $nr_regal = $_POST["nr_regal"];
    $alphabet = $_POST["alphabet"];


    $insertQuery = "INSERT INTO users (title, author, category, nr_polki, nr_regal, alphabet) VALUES ('$title', '$author', '$category', '$nr_polki', '$nr_polki', '$alphabet')";
    if ($conn->query($insertQuery) === TRUE) {
        header("Location: library.php");
        exit();
    } else {
        echo "Błąd podczas dodawania książki: " . $conn->error;
    }
}

// Zapytanie SQL do pobrania listy książek
$sql = "SELECT * FROM users";
if (isset($_GET["category"])) {
    $selectedCategory = $_GET["category"];
    $sql .= " WHERE category='$selectedCategory'";
}

if (isset($_GET["nr_polki"])) {
    $selectedNr_polki = $_GET["nr_polki"];
    $sql .= " WHERE nr_polki='$selectedNr_polki'";
}

if (isset($_GET["nr_regal"])) {
    $selectedNr_polki = $_GET["nr_regal"];
    $sql .= " WHERE nr_regal='$selectedNr_regal'";
}

if (isset($_GET["alphabet"])) {
    $selectedAlphabet = $_GET["alphabet"];
    $sql .= " WHERE alphabet='$selectedAlphabet'";
}
$result = $conn->query($sql);

// Wyświetlanie książek
$usersList = "";
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $usersList .= "<p>Tytuł: " . $row["title"] . "</p>";
        $usersList .= "<p>Autor: " . $row["author"] . "</p>";
        $usersList .= "<p>Gatunek: " . $row["category"] . "</p>";
        $usersList .= "<p>Nr półki: " . $row["nr_polki"] . "</p>";
        $usersList .= "<p>Nr regału: " . $row["nr_regal"] . "</p>";
        $usersList .= "<p>Litera: " . $row["alphabet"] . "</p>";


        // Przyciski Usuń i Edytuj
        $usersList .= "<form action='library.php' method='GET'>";
        $usersList .= "<input type='hidden' name='delete' value='" . $row["id"] . "'>";
        $usersList .= "<button type='submit'>Usuń</button>";
        $usersList .= "</form>";

        $usersList .= "<button onclick='showEditForm(" . $row["id"] . ")'>Edytuj</button>";

        // Formularz edycji
        $usersList .= "<div id='edit-form-" . $row["id"] . "' style='display: none;'>";
        $usersList .= "<form action='library.php' method='POST'>";
        $usersList .= "<input type='hidden' name='book-id' value='" . $row["id"] . "'>";
        $usersList .= "<input type='text' name='new-author' placeholder='Nowy autor'>";
        $usersList .= "<input type='text' name='new-title' placeholder='Nowy tytuł'>";

        $usersList .= "<select name='new-category'>";
        $usersList .= "<option value='' disabled selected>Wybierz gatunek</option>";
        $usersList .= "<option value='fantasy'>Fantasy</option>";
        $usersList .= "<option value='horror'>Horror</option>";
        $usersList .= "<option value='sci-fi'>Sci-fi</option>";
        $usersList .= "<option value='comedy'>Komedia</option>";
        $usersList .= "<option value='documentary'>Dokument</option>";
        $usersList .= "</select>";

        $usersList .= "<select name='new-nr_polki'>";
        $usersList .= "<option value='' disabled selected>Wybierz nr półki</option>";
        $usersList .= "<option value='1'>1</option>";
        $usersList .= "<option value='2'>2</option>";
        $usersList .= "<option value='3'>3</option>";
        $usersList .= "<option value='4'>4</option>";
        $usersList .= "<option value='5'>5</option>";
        $usersList .= "</select>";

        $usersList .= "<select name='new-nr_regal'>";
        $usersList .= "<option value='' disabled selected>Wybierz nr regału</option>";
        $usersList .= "<option value='R1'>R1</option>";
        $usersList .= "<option value='R2'>R2</option>";
        $usersList .= "<option value='R3'>R3</option>";
        $usersList .= "<option value='R4'>R4</option>";
        $usersList .= "<option value='R5'>R5</option>";
        $usersList .= "</select>";

        $usersList .= "<select name='new-alphabet'>";
        $usersList .= "<option value='' disabled selected>Wybierz litere</option>";
        $usersList .= "<option value='A'>A</option>";
        $usersList .= "<option value='B'>B</option>";
        $usersList .= "<option value='C'>C</option>";
        $usersList .= "<option value='D'>D</option>";
        $usersList .= "<option value='E'>E</option>";
        $usersList .= "</select>";

        $usersList .= "<button type='submit' name='edit'>Zapisz</button>";
        $usersList .= "</form>";
        $usersList .= "</div>";

        $usersList .= "<hr>";
    }
} else {
    $usersList = "Brak książek w bibliotece.";
}

$conn->close();
?>
<!DOCTYPE html>
<html>
<head>
    <title>Biblioteka domowa</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script>
        function showEditForm(bookId) {
            var editForm = document.getElementById('edit-form-' + bookId);
            if (editForm.style.display === 'none') {
                editForm.style.display = 'block';
            } else {
                editForm.style.display = 'none';
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Biblioteka domowa</h1>
        <p>Zalogowany jako: <?php echo $_SESSION["username"]; ?></p>
        <a href="library.php?logout=true">Wyloguj</a>

        <div class="form-container">
            <h2>Dodaj nową książkę</h2>
            <form action="library.php" method="POST">
                <input type="text" name="title" placeholder="Tytuł" required>
                <input type="text" name="author" placeholder="Autor" required>
                <select name="category" required>
                    <option value="" disabled selected>Wybierz gatunek</option>
                    <option value="fantasy">Fantasy</option>
                    <option value="horror">Horror</option>
                    <option value="sci-fi">Sci-fi</option>
                    <option value="comedy">Komedia</option>
                    <option value="documentary">Dokument</option>
                </select>

                <select name="nr_polki" required>
                    <option value="" disabled selected>Wybierz nr półki</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>

                <select name="nr_regal" required>
                    <option value="" disabled selected>Wybierz nr regału</option>
                    <option value="R1">R1</option>
                    <option value="R2">R2</option>
                    <option value="R3">R3</option>
                    <option value="R4">R4</option>
                    <option value="R5">R5</option>
                </select>

                <select name="alphabet" required>
                    <option value="" disabled selected>Wybierz literę</option>
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                    <option value="E">E</option>
                </select>

                <button type="submit" name="submit">Dodaj</button>
            </form>
        </div>

        <div class="users-container">
            <h2>Książki w bibliotece</h2>
            <form action="library.php" method="GET">
                <select name="category">
                    <option value="" disabled selected>Wybierz gatunek</option>
                    <option value="fantasy">Fantasy</option>
                    <option value="horror">Horror</option>
                    <option value="sci-fi">Sci-fi</option>
                    <option value="comedy">Komedia</option>
                    <option value="documentary">Dokument</option>
                </select>
                <button type="submit">Filtruj</button>
            </form>
            <?php echo $usersList; ?>
        </div>
    </div>
</body>
</html>