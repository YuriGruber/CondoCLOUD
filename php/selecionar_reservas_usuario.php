<?php
include('config.php');
include('lib.php');

if($_SERVER['REQUEST_METHOD'] == 'POST'){    
    $query = pg_query($GLOBALS['conn'], "SELECT id_reserva, area.id_area, area.nome_area, data
                                            FROM reserva
                                            INNER JOIN area ON reserva.id_area = area.id_area
                                            WHERE id_usuario = '{$_SESSION['idUsuario']}'");
                                            
    serializarQuery($query);                                      
}