<?php
    include('config.php');

    echo json_encode([
                        'nomeUsuario' => $_SESSION['nomeUsuario'],
                        'nomeCondominio' => $_SESSION['nomeCondominio']
                    ]);