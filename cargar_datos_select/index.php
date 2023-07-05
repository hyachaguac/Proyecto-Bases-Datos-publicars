<?php 
	require "conexion/conexion.php";
	$objeConexion = new Conexion();
?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cargar datos de una BD en un select - HTML, PHP Y MySQL</title>
<style type="text/css">
	body{
		background-color: #FFF;		
	}
	#container{
		font-family:Verdana, Geneva, sans-serif;
		font-size:18px;
		width:80%;
		color:#000;
	}	
	.fila {padding-bottom: 6px;overflow:auto;overflow:auto;}
	.lab_camp {width:50%; float:left;}
	.boton {text-align:center;}
</style>
</head>

<body>
	<div id="container">
    	<fieldset>
        	<div>
            	<h1>Cargar datos de una BD en un select - HTML, PHP Y MySQL</h1>
            </div>
        	<div class="fila" style="padding-bottom: 6px;overflow:auto;">
            	<label>Valores del select</label>
        		<select>
                	<?php 
						$query = "select * from usuarios";
						$result = mysqli_query($objeConexion->conectarse(), $query) or die(mysqli_error());;
						while($row = mysqli_fetch_array($result)){
							?>
							<option title="<?php echo $row["telefono"]." ".$row["ciudad"]; ?>" value="<?php echo $row["codigo"]; ?>"> 
								<?php echo $row["nombres"]." ".$row["apellidos"]; ?> 
                            </option>
							<?php
						}
					?>
                </select>
            </div>                                    
            <div>
            	<h2><a href="http://www.codigoweblibre.tk" target="_blank">http://www.codigoweblibre.tk</a></h2>
                <h2>Canal en youtube: codigoweblibre</h2>
                <h2>codigoweblibre</h2>
            </div>
        </fieldset>
    </div>    
</body>
</html>