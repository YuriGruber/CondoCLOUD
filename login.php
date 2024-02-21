<?php
    include('dao/dao.php');
    
    if($_SERVER["REQUEST_METHOD"] == 'POST'){
        $usuario = $_POST["usuario"];
        $senha = $_POST["senha"];

        login($usuario, $senha);
    }
    
?>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="login.css">
        <meta charset="UTF-8">
        <title>Login</title>
    </head>
    
    <body>
        <div id="caixaLogin">
            <form method="post" action="#">
                <h2>Login</h2>
                <p>Usuário</p>
                <p><input type="text" id="usuario" name="usuario"></p>
                <p>Senha</p>
                <p><input type="password" id="senha" name="senha"></p>
                <p><input type="submit" value="Entrar"></p>
            </form>
        </div>
    </body>
</html>
