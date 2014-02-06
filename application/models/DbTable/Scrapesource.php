<?php

class Application_Model_DbTable_Scrapesource extends My_Model
{
    protected $_name = 'Scrapesource';
    protected $_alias = 'scrapesource';
    protected $_soft_delete = true;
    
    
    function save($data, $where = '') {
		$hashes = $data['hashes'];
		unset($data['hashes']);
		$id = parent::save($data, $where = '');
		if($id) {
			$this->saveHashes($id, $hashes);
		}
		return $id;
	}
	
	function delete($where) {
		if(is_numeric($where)){
            $where = $this->getPrimary() . " = " . $where;
        }

		$query = $this->select($this->getPrimary())->where($where)->_getQuery();
		
		Jien::model('Scrapesourcehash')->delete('scrapesource_id IN (' . $query . ')');
		return parent::delete($where);
	}
	
	protected function saveHashes($scrapeSource_id, $hashes) {
		$hashes = explode(',', $hashes);
		$hashes = array_map('trim', $hashes);
		
		$hashesModel = Jien::model('Scrapesourcehash');
		
		$current_hashes_rows = $hashesModel->where('scrapesource_id', $scrapeSource_id)->get()->rows();
		
		$current_hashes = array();
		
		$deleted_hashes_ids = array();
		
		foreach($current_hashes_rows as $_hash) {
			// check if hash was removed
			if(false === array_search($_hash['hash'], $hashes)) {
				$deleted_hashes_ids[] =  $_hash[$hashesModel->getPrimary()];
			}
			else {
				// save hashes for combarision with new hashes
				$current_hashes[] = $_hash['hash'];
			}
		}
		$hashesModel->bulk('delete', $deleted_hashes_ids);

		$new_hashes = array_diff($hashes, $current_hashes);
		foreach($new_hashes as $hashString) {
			$hashesModel->insert(array('scrapesource_id' => $scrapeSource_id, 'hash' => $hashString, ));
		}
	}
}
