<incluir archivo="Header">
<incluir archivo="Menu">
<div class="container">
	<h3>Empresas</h3>
	<p>
		<div class="btn-group">
			<a class="btn btn-primary btn-md" href="{BASE_URL}empresas/nuevo" role="button"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Agregar</a>
			<a class="btn btn-success btn-md" href="{BASE_URL}empresas/mapa" role="button"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> Mapa</a>
		</div>
	</p>
	<tabla datos="catalogo" pagina="10" exportar="true" buscar="true" clic="editarElemento">
</div>
<incluir archivo="Footer">