<?php
/**
 * Manejo de datos de empresas
 */
class Modelos_Empresas extends Sfphp_Modelo 
{
	/**
	 * Obiene los datos
	 * @param  string $id Id del almacen
	 * @return array
	 */
	public function get($id = '')
	{
		$where = NULL;
		$query = "SELECT empresa, razonSocial
		FROM empresas ";
		if(trim($id) != "")
			$where = " WHERE empresa = {$id};";
		return $this->db->query($query.$where);
	}

	/**
	 * Inserta
	 * @param  array $data Datos
	 * @return array
	 */
	public function post($data)
	{
		$query = "INSERT INTO empresas
		SET
			razonSocial = '{$data['empresa']['razonSocial']}',
			rfc = '{$data['empresa']['rfc']}',
			domicilioFiscal = '{$data['empresa']['domicilioFiscal']}';";
		$idInsert = $this->db->insert($query);
		if($idInsert) {
			if(trim($data['contactos']['nombre']) != "") {
				$query = "INSERT INTO empresasContactos
				SET
					empresa = '$idInsert',
					nombre = '{$data['contactos']['nombre']}',
					correo = '{$data['contactos']['correo']}',
					telefono = '{$data['contactos']['telefono']}';";
				$this->db->insert($query);
			}
		}
		return $idInsert;
	}

	/**
	 * Elimina
	 * @param  string $id Id
	 * @return array
	 */
	public function del($id)
	{
		$query = "DELETE FROM empresas 
		WHERE empresa = {$id};";
		return $this->db->query($query.$where);
	}

	/**
	 * Devuelve grid
	 * @return array
	 */
	public function grid()
	{
		$query = "SELECT empresa Empresa, razonSocial Nombre, rfc RFC
		FROM empresas;";
		return $this->db->query($query);
	}

	public function direcciones()
	{
		$query = "SELECT empresa,razonSocial,domicilioFiscal FROM empresas;";
		return $this->db->query($query);
	}
}