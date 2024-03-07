<?php
include('config.php');
include('lib.php');

if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $idArea = $_POST['area'];
    $mes = $_POST['mes'];
    $ano = $_POST['ano'];
    
    $query = pg_query($GLOBALS['conn'], "SELECT EXTRACT(DAY FROM data) AS dia
                                            FROM reserva
                                            WHERE id_condominio='{$_SESSION['idCondominio']}'
                                            AND id_area='{$idArea}'
                                            AND EXTRACT(MONTH FROM data) = '{$mes}'
                                            AND EXTRACT(YEAR FROM data) = '{$ano}'");
                                            
     serializarQuery($query);
}