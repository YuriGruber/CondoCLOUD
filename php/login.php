<?php

session_start();
include('config.php');

if($_SERVER["REQUEST_METHOD"] == 'POST'){
    $usuario = $_POST["usuario"];
    $senha = $_POST["senha"];
    $query = pg_query($GLOBALS['conn'], "SELECT * FROM usuario WHERE nome_usuario='{$usuario}' AND senha='{$senha}'");    
    if (!pg_num_rows($query)){
        echo "<script>alert('Usuário / senha inválido(s).')</script>";
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
        header('Location:../usuario.html');
        exit();
    }
}


// if de testes, não precisa entrar com usuário e senha toda vez pra acessar a área do 
/*
if($_SERVER["REQUEST_METHOD"] == 'POST'){
        $_SESSION['idUsuario'] = 1;

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
        header('Location:../usuario.html');
        exit();
}
 * 
 */
