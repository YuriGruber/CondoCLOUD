<?php
include('../dao/dao.php');

if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $idArea = $_POST['area'];
    $mes = $_POST['mes'];
    $ano = $_POST['ano'];
    
    selectDiasReservados($idArea, $dia, $mes);
}
