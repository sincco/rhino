<?php
/**
 * Manejo de datos de empleados
 */
class Modelos_Empleados extends Sfphp_Modelo 
{
	/**
	 * Obiene los datos (por su id)
	 * @param  string $id Id del cliente a consultar
	 * @return array
	 */
	public function get($id = '')
	{
		$where = NULL;
		$query = "SELECT 
			cli.cliente, cli.razonSocial, cli.rfc, cli.direccionFiscal, cli.activo
		FROM
			empleados cli";
		if(trim($id) != "")
			$where = " WHERE cliente = {$id};";
		return $this->db->query($query.$where);
	}

	/**
	 * Inserta
	 * @param  array $data Datos del registro
	 * @return array
	 */
	public function post($data)
	{
		$query = "INSERT INTO empleados
		SET
			nombres = '{$data['generales']['nombres']}',
			apellidos = '{$data['generales']['apellidos']}',
			nacionalidad = '{$data['generales']['nacionalidad']}',
			genero = '{$data['generales']['genero']}',
			estadoCivil = '{$data['generales']['estadoCivil']}',
			nacimiento = '{$data['generales']['nacimiento']}',
			correo = '{$data['generales']['correo']}',
			telefonoPrincipal = '{$data['generales']['telefonoPrincipal']}',
			direccion = '{$data['generales']['direccion']}',
			estado = '{$data['generales']['estado']}',
			municipio = '{$data['generales']['municipio']}',
			localidad = '{$data['generales']['localidad']}',
			codigoPostal = '{$data['generales']['codigoPostal']}',
			;";
		$idInsert = $this->db->insert($query);
		if($idInsert) 
		{
			if(trim($data['contactos']['nombre']) != "") {
				$query = "INSERT INTO empleadosContactos
				SET
					cliente = '$idInsert',
					nombre = '{$data['contactos']['nombre']}',
					correo = '{$data['contactos']['correo']}',
					telefono = '{$data['contactos']['telefono']}';";
				$this->db->insert($query);
			}
			if(trim($data['direcciones']['alias']) != "") {
				$query = "
				INSERT INTO empleadosDirecciones
				SET
					cliente = '$idInsert',
					alias = '{$data['direcciones']['alias']}',
					domicilio = '{$data['direcciones']['domicilio']}',
					telefono = '{$data['direcciones']['telefono']}';";
				$this->db->insert($query);
			}
		}
		return $idInsert;
	}

	/**
	 * Elimina
	 * @param  string $id Id del cliente
	 * @return array
	 */
	public function del($id)
	{
		$query = "
		UPDATE empleados
		SET activo = 0 
		WHERE cliente = {$id};";
		return $this->db->query($query.$where);
	}

	/**
	 * Devuelve todos los empleados para dibujar el grid
	 * @return array
	 */
	public function grid()
	{
		$query = "
		SELECT 
			cli.cliente Clave, cli.razonSocial 'Razon Social', cli.rfc RFC, cli.direccionFiscal 'Direccion Fiscal', cli.activo Activo
		FROM
			empleados cli;";
		return $this->db->query($query);
	}

	public function direcciones()
	{
		$query = "
		SELECT 
			cli.cliente, cli.razonSocial, cli.rfc, cli.direccionFiscal, cli.activo Activo
		FROM
			empleados cli
		WHERE activo = 1;";
		return $this->db->query($query);
	}
}