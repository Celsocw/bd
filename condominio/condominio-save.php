<?php
include('../connect.php');

if ($_POST['nome'] == "") {
    echo "Por favor, informe o nome!";
} else if ($_POST['cnpj'] == "") {
    echo "Por favor, informe o CNPJ!";
} else if ($_POST['rua'] == "") {
    echo "Por favor, informe a rua!";
} else if ($_POST['numero'] == "") {
	echo "Por favor, informe o número!";
} else if ($_POST['bairro'] == "") {
	echo "Por favor, informe o bairro!";
} else if ($_POST['cep'] == "") {
	echo "Por favor, informe o CEP!";
} else {
    $nome = $_POST['nome'];
    $rua = $_POST['rua'];
	$numero = $_POST['numero'];
	$bairro = $_POST['bairro'];
	$cep = $_POST['cep'];
	$cnpj = $_POST['cnpj'];
    $sql = "INSERT INTO condominio (nome, cnpj, bairro, rua, cep, numero) VALUES('$nome',$cnpj, '$bairro', '$rua', $cep, $numero);";
	//$sql = "INSERT INTO aluno (nome, email, senha) VALUES ('$nome', '$email', '$senha');";
	
    if ($mysqli->query($sql) == true) {
        //header('Location: http://localhost:80/bd/index.php');
		echo "<script>alert('Condomínio adicionado com sucesso!');window.location.href='../index.php';</script>";
    } else {
        echo "Erro ao adicionar o condomínio!";
    }
}
$mysqli->close();?>

