<incluir archivo="Header">
<incluir archivo="Menu">

<div class="container">
	<h3>Registro de Candidatos</h3>
	<div class="bs-example">
	    <ul class="nav nav-tabs" id="tabs">
	        <li><a data-toggle="tab" href="#generales">Generales</a></li>
	        <li><a data-toggle="tab" href="#experiencia">Experiencia</a></li>
	        <li><a data-toggle="tab" href="#habilidades">Habilidades</a></li>
	    </ul>
	    <div class="tab-content">
	        <div id="generales" class="tab-pane fade in active">
	            <h5>Datos generales</h5>
	            <form id="empleadosGenerales">
					<label>Nombres</label>
					<input type="text" class="form-control" name="nombres">
					<label>Apellidos</label>
					<input type="text" class="form-control" name="apellidos">
					<label>Nacionalidad</label>
					<select class="form-control" name="nacionalidad">
						<option value="Mexicana">Mexicana</option>
						<option value="Extranjera">Extranjera</option>
					</select>
					<label>Género</label>
					<select class="form-control" name="genero">
						<option value="Masculino">Masculino</option>
						<option value="Femenino">Femenino</option>
					</select>
					<label>Estado Civil</label>
					<select class="form-control" name="estadoCivil">
						<option value="Soltero">Soltero</option>
						<option value="Casado">Casado</option>
						<option value="Viudo">Viudo</option>
						<option value="Divorciado">Divorciado</option>
					</select>
					<label>Correo electrónico</label>
					<input type="text" class="form-control" name="correo">
					<label>Telefono principal</label>
					<input type="text" class="form-control" name="telefonoPrincipal">
					<label>Nacimiento</label><br>
					<input data-provide="da<tepicker" data-date-format="dd/mm/yyyy" name="nacimiento"><br><br>
	            </form>
	        </div>
	        <div id="experiencia" class="tab-pane fade">
	            <h5>Experiencias</h5>
	            <form name="empleadosExperiencias[]">
	            	<label>Desde</label><br>
					<input data-provide="da<tepicker" data-date-format="dd/mm/yyyy" name="nacimiento"><br><br>
					<label>Hasta (vacío para actual)</label><br>
					<input data-provide="da<tepicker" data-date-format="dd/mm/yyyy" name="nacimiento"><br><br>
					<label>Puesto</label>
					<input type="text" class="form-control" name="puesto">
					<label>Oranización</label>
					<input type="text" class="form-control" name="organización">
					<label>Detalle</label>
					<textarea class="form-control" name="detalle"></textarea>
	            </form>
	        </div>
	        <div id="habilidades" class="tab-pane fade">
	            <h5>Contactos</h5>
	            <form id="empleadosContactos">
					<label>Nombre</label>
					<input type="text" class="form-control" name="nombre">
					<label>Correo</label>
					<input type="text" class="form-control" name="correo">
					<label>Telefono</label>
					<input type="text" class="form-control" name="telefono">
	            </form>
	        </div>
	    </div>
	    <br>
	    <p><a class="btn btn-primary btn-md" href="#" role="button" onclick="guardarCliente()">Guardar</a></p>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){ 
	$("#tabs li:eq(0) a").tab('show')
})

function guardarCliente() {
	var cliente = {cliente:$("#empleadosGenerales").serializeJSON(), direcciones:$("#empleadosDirecciones").serializeJSON(), contactos:$("#empleadosContactos").serializeJSON()}
	sincco.consumirAPI('POST','{BASE_URL}candidatos/apiPost',cliente)
	.done(function(data) {
		if(data.respuesta)
			window.location = '{BASE_URL}candidatos'
	}).fail(function(jqXHR, textStatus, errorThrown) {
		console.log(errorThrown)
	})	
}
</script>
<incluir archivo="Footer">