<?php
session_start();
include(dirname(__FILE__)."/../config.php");
include 'lib.php';

if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $idReserva = $_POST['idReserva'];
    
    $query = pg_query($GLOBALS['conn'], "DELETE FROM reserva WHERE id_reserva={$idReserva}");
    
    encerrarQuery($query, "Reserva cancelada com sucesso.");
}
