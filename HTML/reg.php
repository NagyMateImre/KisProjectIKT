<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

$host = 'localhost';
$db   = 'kisproject';
$user = 'root';
$pass = '';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

try {
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);

    $input = $_POST;
    if (empty($input)) {
        $raw = file_get_contents('php://input');
        $input = json_decode($raw, true) ?? [];
    }

    $nev = $input['nev'] ?? $input['Name'] ?? null;
    $loginName = $input['loginName'] ?? $input['LoginName'] ?? null;
    $mobil = $input['mobil'] ?? $input['Mobile'] ?? null;
    $email = $input['email'] ?? $input['Email'] ?? null;
    $password = $input['password'] ?? $input['Password'] ?? null;
    $car = $input['car'] ?? $input['Car'] ?? null;
    $pc = $input['pc'] ?? $input['PC'] ?? null;
    $roles = $input['roles'] ?? $input['Roles'] ?? null;

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
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => $e->getMessage()]);
}
?>