<?php
session_start();
$host = "localhost";
$database = "condominio";
$user = "postgres";
$password = "admin";

global $conn;
$conn = pg_connect("host=$host dbname=$database user=$user password=$password");
    
if (!$conn) {
    die("Falha na conexão: " . pg_last_error());
}

function login($usuario, $senha){
    $query = pg_query($GLOBALS['conn'], "SELECT * FROM usuario WHERE nome_usuario='{$usuario}' AND senha='{$senha}'");    
    if (!pg_num_rows($query)){
        echo "<script>alert('Usuário / senha inválido.')</script>";
    }else{
        $dados = pg_fetch_assoc($query);
        $_SESSION['idUsuario'] = $dados["id_usuario"];
        
        $query = pg_query($GLOBALS['conn'], "SELECT nome_usuario, condominio.id_condominio, nome_condominio
                                                FROM usuario 
                                                INNER JOIN condominio
                                                ON usuario.id_condominio = condominio.id_condominio
                                                WHERE id_usuario='{$_SESSION['idUsuario']}'");
    
        $dados = pg_fetch_assoc($query);
        $_SESSION['nomeUsuario'] = $dados['nome_usuario'];
        $_SESSION['idCondominio'] = $dados['id_condominio'];
        $_SESSION['nomeCondominio'] = $dados['nome_condominio'];
        
        //Carregar página da área do morador
        header('Location:usuario.php');
        exit();
    }
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

function getNomeUsuario(){
    return $_SESSION['nomeUsuario'];
}

function getNomeCondominio(){
    return $_SESSION['nomeCondominio'];
}

function serializarQuery($query){
    $valores = array();
    while($linha = pg_fetch_assoc($query)){
        $valores[] = $linha;
    }
    
    return json_encode($valores);
}

///////////////////////SELECT////////////////////////

function selectListaEspacosCondominio(){   
    $query = pg_query($GLOBALS['conn'], "SELECT area.id_area, nome_area, nome_area
                                            FROM area
                                            INNER JOIN estrutura_condominio
                                            ON area.id_area = estrutura_condominio.id_area
                                            WHERE id_condominio = '{$_SESSION['idCondominio']}'");
    
    $areas = array();
    while($linha = pg_fetch_assoc($query)){
         $areas[] = $linha;
    }

    return json_encode($areas);
}

function selectListaReservasUsuario(){
    $query = pg_query($GLOBALS['conn'], "SELECT id_reserva, area.id_area, area.nome_area, data
                                            FROM reserva
                                            INNER JOIN area ON reserva.id_area = area.id_area
                                            WHERE id_usuario = '{$_SESSION['idUsuario']}'");
    
    $reservas = array();
    while($linha = pg_fetch_assoc($query)){
        $reservas[] = $linha;
    }
    
    return json_encode($reservas);
}

function selectDiasReservados($idArea, $dia, $mes){
     $query = pg_query($GLOBALS['conn'], "SELECT EXTRACT(DAY FROM data) AS dia
                                            FROM reserva
                                            WHERE id_condominio='{$_SESSION['idCondominio']}'
                                            AND id_area='{$areaSelecionada}'
                                            AND EXTRACT(MONTH FROM data) = '{$mes}'
                                            AND EXTRACT(YEAR FROM data) = '{$ano}'");
                                            
     serializarQuery($query);                                        
}

///////////////////////INSERT////////////////////////

function insertReserva($idArea, $dia, $mes, $ano){
    // Combina os valores de dia, mês e ano para criar uma string de data no formato "YYYY-MM-DD"
    $dataFormatada = sprintf("%04d-%02d-%02d", $ano, $mes, $dia);

    $query = pg_query($GLOBALS['conn'], "INSERT INTO reserva(id_area, id_usuario, id_condominio, data)
                                            VALUES ('{$idArea}', '{$_SESSION['idUsuario']}', '{$_SESSION['idCondominio']}', '{$dataFormatada}')");
                                            
    encerrarQuery($query, "Espaço reservado com sucesso.");                                        
}

///////////////////////DELETE////////////////////////

function deleteReserva($idReserva){
    $query = pg_query($GLOBALS['conn'], "delete from reserva where id_reserva={$idReserva}");
    
    encerrarQuery($query, "Reserva cancelada com sucesso.");
}