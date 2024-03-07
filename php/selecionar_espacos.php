<?php
include('config.php');
include('lib.php');

if($_SERVER["REQUEST_METHOD"] == 'POST'){
    $query = pg_query($GLOBALS['conn'], "SELECT area.id_area, nome_area, nome_area
                                            FROM area
                                            INNER JOIN estrutura_condominio
                                            ON area.id_area = estrutura_condominio.id_area
                                            WHERE id_condominio = '{$_SESSION['idCondominio']}'");                                         
    serializarQuery($query);
}

