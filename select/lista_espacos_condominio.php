<?php
include('../dao/dao.php');

if($_SERVER['REQUEST_METHOD'] == 'POST'){
    echo selectListaEspacosCondominio();
}
