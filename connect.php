<?php
/* Fazer a conexão com o BD
 * Informar o ip do servidor: localhost
 * Informar o nome do usuário: root
 * Informar a senha do usuário: master
 * Informar o nome do database: biblioteca_univali
 */

$mysqli = new mysqli('localhost:3306', 'root', '1234', 'SolNascente');

if (mysqli_connect_error()) {
    echo "Erro ao conectar com o BD: " . mysqli_connect_error();
    exit();
}