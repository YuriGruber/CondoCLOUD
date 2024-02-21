<?php
    include('../dao/dao.php');

    /*
if($_SERVER["REQUEST_METHOD"] == "POST"){
    $idUsuario = $_SESSION['idUsuario'];
    $idCondominio = $_SESSION['idCondominio'];
    $idArea = $_POST['area'];
    $dia = $_POST['dia'];
    $mes = $_POST['mes'];
    $ano = $_POST['ano'];

    // Combina os valores de dia, mês e ano para criar uma string de data no formato "YYYY-MM-DD"
    $dataFormatada = sprintf("%04d-%02d-%02d", $ano, $mes, $dia);       

    $query = pg_query($GLOBALS['conn'], "INSERT INTO reserva(id_area, id_usuario, id_condominio, data) VALUES ('{$idArea}', '{$idUsuario}', '{$idCondominio}', '{$dataFormatada}')");

    if ($query) {
        $resposta = array("mensagem" => "Espaço reservado com sucesso");
    } else {
        $resposta = array("erro" => "Erro ao gravar valores: ". pg_last_error($GLOBALS['conn']));
    }

     // Envia a resposta como JSON (Se não ele vai achar que retornou com erro)
    header('Content-Type: application/json');
    echo json_encode($resposta);
}
     * 
     */

if($_SERVER["REQUEST_METHOD"] == "POST"){
    $idArea = $_POST['area'];
    $dia = $_POST['dia'];
    $mes = $_POST['mes'];
    $ano = $_POST['ano'];
    
    insertReserva($idArea, $dia, $mes, $ano);
}