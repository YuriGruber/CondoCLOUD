<?php

session_start();

echo json_encode([
                    'nomeUsuario' => $_SESSION['nomeUsuario'],
                    'nomeCondominio' => $_SESSION['nomeCondominio']
                ]);