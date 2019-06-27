<?php
// abrimos la sesión cURL
 $nombres=$_POST['nombres'];
  $apellidos=$_POST['apellidos'];
  $edad=$_POST['edad'];
$ch = curl_init();


    
// definimos la URL a la que hacemos la petición
curl_setopt($ch, CURLOPT_URL,"http://".$_ENV["APIINSERT"]."/");
// indicamos el tipo de petición: POST
curl_setopt($ch, CURLOPT_POST, TRUE);
// definimos cada uno de los parámetros
curl_setopt($ch, CURLOPT_POSTFIELDS, "nombres=".$nombres."&apellidos=".$apellidos."&edad=".$edad);

// recibimos la respuesta y la guardamos en una variable
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$remote_server_output = curl_exec ($ch);

// cerramos la sesión cURL
curl_close ($ch);

// hacemos lo que queramos con los datos recibidos
// por ejemplo, los mostramos
print_r($remote_server_output);

