

<html>
    <head>
        <title>
          Pagina Seminario
        </title>
    </head>
    <body>
        <h1>Seminario de Sistemas 1</h1>
        <h2>Proyecto 1</h2>
        <h3>Haroldo Pablo Arias Molina - 201020247</h3>
        <h3>Jorge Daniel Monterroso Nowell - 201504303</h3>

        <h4>Datos API 1</h4>

        <table>
            <tr>
                <th>Nombres</th> <th>Apellidos</th> <th>Edad</th>
            </tr>
                <?php
                    $return = file_get_contents("http://".$_ENV["APICONSULTA"]."/ApiConsulta/index.php");
                    $array = json_decode($return, true);
                    //var_dump($array);
                    foreach ($array as $value) {
                        foreach ($value as $row) {
                            $cadena = "<tr> <td>". $row["Nombres"] ."</td> <td> ". $row["Apellidos"] ."</td> <td> ". $row["Edad"] ."</td></tr>";
                            echo $cadena ;
                         }
                     }

                ?>

            
        </table>

        <br/>
        <br/>
        
        <h4>Insert Datos Api 2</h4>

        <form action=<?php echo "http://".$_ENV["APIINSERT"]."/ApiInsert/index.php";?> method="post">
            <p>Su nombre: <input type="text" name="nombres" id="nombres" /></p>
            <p>Su nombre: <input type="text" name="apellidos" id="apellidos"/></p>
            <p>Su edad: <input type="text" name="edad" id="edad" /></p>
            <p><input type="submit" /></p>
        </form>

    </body>
</html>



