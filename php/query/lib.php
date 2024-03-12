<?php

function serializarQuery($query){
    $valores = array();
    while($linha = pg_fetch_assoc($query)){
        $valores[] = $linha;
    }
    
    //header('Content-Type: application/json');
    echo json_encode($valores);
}

function encerrarQuery($query, $mensagemDeSucesso){
    if ($query) {
        $resposta = array("mensagem" => $mensagemDeSucesso);
    } else {
        $resposta = array("erro" => "Erro ao gravar valores: ". pg_last_error($GLOBALS['conn']));
    }

     // Envia a resposta como JSON (Se não ele vai achar que retornou com erro)
    header('Content-Type: application/json');
    echo json_encode($resposta);
}

