<?php
include('../dao/dao.php');
 
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $idReserva = $_POST['idReserva'];
    
    deleteReserva($idReserva);
}

