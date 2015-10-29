<?php
/**
 * Operaciones con empleados
 */
class Controladores_Candidatos extends Sfphp_Controlador
{
	/**
	 * Muestra el grid del catálogo de empleados
	 * @return none
	 */
	public function inicio()
	{
		$this->_vista->catalogo = $this->modeloEmpleados->grid();
		$this->vistaCandidatos;
	}

	/**
	 * Muestra el formulario de captura de empleados
	 * @return none
	 */
	public function nuevo()
	{
		$this->vistaCandidatosAlta;
	}

	/**
	 * Llamada AJAX para insertar cliente
	 * @return json
	 */
	public function apiPost()
	{
		$data = Sfphp_Peticion::get()['_parametros'];
		echo json_encode(array("respuesta"=>$this->modeloEmpleados->post($data)));
	}

	/**
	 * Muestra el grid del catálogo de empleados
	 * @return none
	 */
	public function apiGrid()
	{
		echo json_encode($this->modeloEmpleados->grid());
	}

	/**
	 * Devuelve las direcciones de los empleados para el mapa
	 * @return json
	 */
	public function apiMapaDirecciones()
	{
		echo json_encode($this->modeloEmpleados->direcciones());
	}

	public function mapa()
	{
		$this->_vista->direcciones = json_encode($this->modeloEmpleados->direcciones());
		$this->vistaCandidatosMapa;
	}

}