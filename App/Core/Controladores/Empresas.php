<?php
/**
 * Operaciones con empresas
 */
class Controladores_Empresas extends Sfphp_Controlador
{
	/**
	 * Muestra el grid
	 * @return none
	 */
	public function inicio()
	{
		$this->_vista->catalogo = $this->modeloEmpresas->grid();
		$this->vistaEmpresas;
	}

	/**
	 * Muestra el formulario de captura
	 * @return none
	 */
	public function nuevo()
	{
		$this->vistaEmpresasAlta;
	}

	/**
	 * Llamada AJAX para insertar
	 * @return json
	 */
	public function apiPost()
	{
		$data = Sfphp_Peticion::get()['_parametros'];
		echo json_encode(array("respuesta"=>$this->modeloEmpresas->post($data)));
	}

	/**
	 * Devuelve las direcciones de los empleados para el mapa
	 * @return json
	 */
	public function apiMapaDirecciones()
	{
		echo json_encode($this->modeloEmpresas->direcciones());
	}

	public function mapa()
	{
		$this->_vista->direcciones = json_encode($this->modeloEmpresas->direcciones());
		$this->vistaEmpresasMapa;
	}

}