<?php
    session_start();
    $host = "localhost";
    $database = "condominio";
    $user = "postgres";
    $password = "admin";

    global $conn;
    $conn = pg_connect("host=$host dbname=$database user=$user password=$password");

    if (!$conn) {
        die("Falha na conexão: " . pg_last_error());
    }
