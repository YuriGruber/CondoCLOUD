<?php
session_start();
include(dirname(__FILE__)."/../config.php");
include 'lib.php';


if($_SERVER["REQUEST_METHOD"] == 'POST'){
    $idArea = $_POST['area'];
    $dia = $_POST['dia'];
    $mes = $_POST['mes'];
    $ano = $_POST['ano'];
    
    // Combina os valores de dia, mês e ano para criar uma string de data no formato "YYYY-MM-DD"
    $dataFormatada = sprintf("%04d-%02d-%02d", $ano, $mes, $dia);

    $query = pg_query($GLOBALS['conn'], "INSERT INTO reserva(id_area, id_usuario, id_condominio, data)
                                            VALUES ('{$idArea}', '{$_SESSION['idUsuario']}', '{$_SESSION['idCondominio']}', '{$dataFormatada}')");
                                            
    encerrarQuery($query, "Espaço reservado com sucesso.");    
}
