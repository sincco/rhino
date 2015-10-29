<incluir archivo="Header">
<incluir archivo="Menu">

<div class="container">
	<h3>Registro de Empresas</h3>
	<div class="bs-example">
	    <ul class="nav nav-tabs" id="tabs">
	        <li><a data-toggle="tab" href="#generales">Generales</a></li>
	        <li><a data-toggle="tab" href="#contactos">Contactos</a></li>
	    </ul>
	    <div class="tab-content">
	        <div id="generales" class="tab-pane fade in active">
	            <h5>Datos generales</h5>
	            <form id="empresasGenerales">
					<label>Razón Social</label>
					<input type="text" class="form-control" name="razonSocial">
					<label>RFC</label>
					<input type="text" class="form-control" name="rfc">
					<label>Dirección Fiscal</label>
					<input type="text" class="form-control" name="domicilioFiscal">
	            </form>
	        </div>
	        <div id="contactos" class="tab-pane fade">
	            <h5>Contactos</h5>
	            <form id="empresasContactos">
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
	    <p><a class="btn btn-primary btn-md" href="#" role="button" onclick="guardarEmpresa()">Guardar</a></p>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){ 
	$("#tabs li:eq(0) a").tab('show')
})

function guardarEmpresa() {
	var empresa = {empresa:$("#empresasGenerales").serializeJSON(), contactos:$("#empresasContactos").serializeJSON()}
	sincco.consumirAPI('POST','{BASE_URL}empresas/apiPost',empresa)
	.done(function(data) {
		if(data.respuesta)
			window.location = '{BASE_URL}empresas'
	}).fail(function(jqXHR, textStatus, errorThrown) {
		console.log(errorThrown)
	})	
}
</script>
<incluir archivo="Footer">