<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json; charset=utf-8");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

$host = '127.0.0.1';
$user = 'root';
$pass = '';
$db   = 'kisproject';
$charset = 'utf8mb4';
$port = '3307';

$dsn = "mysql:host=$host;port=$port;dbname=$db;charset=$charset";

try {
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);

    $nev = $_POST['nev'] ?? null;
    $loginName = $_POST['loginName'] ?? null;
    $mobil = $_POST['mobil'] ?? null;
    $email = $_POST['email'] ?? null;
    $password = $_POST['password'] ?? null;
    $car = $_POST['car'] ?? null;
    $pc = $_POST['pc'] ?? null;
    $roles = $_POST['roles'] ?? null;

    $errors = [];

    if (empty($nev)) { $errors[] = "A név mező hiányzik."; }
    if (empty($loginName)) { $errors[] = "A felhasználónév hiányzik."; }
    if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) { $errors[] = "Érvénytelen e-mail cím."; }
    if (empty($password) || !preg_match('/(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/', $password)) { 
        $errors[] = "A jelszó nem felel meg a biztonsági követelményeknek (min. 8 karakter, kis- és nagybetű, szám)."; 
    }
    if (empty($roles)) { $errors[] = "A szerepkör kiválasztása kötelező."; }

    if (!empty($errors)) {
        http_response_code(400);
        echo json_encode(["status" => "error", "message" => implode(" ", $errors)]);
        exit();
    }

    $check = $pdo->prepare("SELECT LoginName, email FROM reg WHERE LoginName = :loginName OR email = :email LIMIT 1");
    $check->execute([
        'loginName' => $loginName,
        'email' => $email
    ]);
    $existing = $check->fetch();

    if ($existing) {
        http_response_code(409);
        if ($existing['LoginName'] === $loginName) {
            $msg = "Ez a felhasználónév már foglalt.";
        } else {
            $msg = "Ez az e-mail cím már regisztrálva van.";
        }
        echo json_encode(["status" => "error", "message" => $msg]);
        exit();
    }

    if ($nev) {
        $sql = "INSERT INTO reg (Name, LoginName, Password, role, Car, PC, Mobil, email) VALUES (:nev, :loginName, :password, :roles, :car, :pc, :mobil, :email)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'nev' => $nev,
            'loginName' => $loginName,
            'mobil' => $mobil,
            'email' => $email,
            'password' => $password,
            'car' => $car,
            'pc' => $pc,
            'roles' => $roles
        ]);

        echo json_encode(["status" => "success", "message" => "Sikeres mentés!"]);
    } else {
        http_response_code(400);
        echo json_encode(["status" => "error", "message" => "Hiányzó 'nev' paraméter."]);
    }

} catch (PDOException $e) {
    if ($e->getCode() == 23000) {
        http_response_code(409);
        echo json_encode(["status" => "error", "message" => "Ez a felhasználónév vagy e-mail már létezik."]);
    } else {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => $e->getMessage()]);
    }
}
?>