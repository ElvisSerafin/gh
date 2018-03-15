<html>
	<head>		
        <script type="text/javascript">
			$(function(){
				$('#login,#password').addClass('inputext');
				$(':button').addClass('inpubutton');
				$('#login,#password').keypress(function(e){if(e.which==13){validar();}});
				setTimeout(function(){$('#login').focus()},20);
				$('#grabar').click(validar);
				$('#cerrar').click(function(){$.facebox.close();});
			});
			function validar(){
				if($('#login').val()==''){
					$('#login').focus();
				}else if($('#password').val()==''){
					$('#password').focus();
				}else{
					$.get('cambiar_firma.jsp',{
							f_login:$('#login').val(),
							f_passwd:$('#password').val(),
							id_regdia:'<%=%>',
							firma:'<%=%>'
						},
						function(data){
							data = $.trim(data);
							if(data!='0'){
								$('#<%=%>').attr('src','../../firmas/' + data + '.jpg');
								$.facebox.close();
							}else{
								$('#mensaje').html('Usuario o password incorrectos');
							}
						});
				}
			}
		</script>
   	</head>
    <body>
          
  <form id="">
    	<table width="300px">
    		
			<tr>
				<td></td>
				<td colspan="2" class="titulo">YA EXISTE UNA FIRMA POR &nbsp;<%=%></td>
			</tr>
    	</table>
        </form>
        

      
        
        
          <form id="datos">
    	<table width="300px">
    		
			<tr>
				<td colspan="2" class="titulo">Validar Usuario</td>
			</tr>
            <tr>
            	<td colspan="2">&nbsp;</td>
            </tr>
			<tr>
				<td class="subtitulo">&nbsp; Usuario</td>
				<td><input type="text" size="15" id="login"></td>
			</tr>
			<tr>
				<td class="subtitulo">&nbsp; Password</td>
				<td><input type="password" size="15" id="password"></td>
			</tr>
			<tr>
				<td colspan="2" id="mensaje" style="font-weight:bold;color:#F00"></td>
			</tr>
            <tr>
            	<td colspan="2" align="center">
                	<input type="button" value="Grabar" id="grabar">
                    <input type="button" value="Cerrar" id="cerrar">
                </td>
            </tr>
		</table>
        </form>

    	
       
   
    </body>
</html>