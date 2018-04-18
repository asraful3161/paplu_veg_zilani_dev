<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


/*
| -----------------------------------------------------
| PRODUCT NAME: 	STOCK MANAGER ADVANCE 
| -----------------------------------------------------
| AUTHER:			MIAN SALEEM 
| -----------------------------------------------------
| EMAIL:			saleem@tecdiary.com 
| -----------------------------------------------------
| COPYRIGHTS:		RESERVED BY TECDIARY IT SOLUTIONS
| -----------------------------------------------------
| WEBSITE:			http://tecdiary.net
| -----------------------------------------------------
|
| MODULE: 			Inventories
| -----------------------------------------------------
| This is inventories module's model file.
| -----------------------------------------------------
*/


class Discount_model extends CI_Model
{
	
	
	public function __construct()
	{
		parent::__construct();

	}
        
        public function getAllCustomer() 
	{
		$this->db->select('*')->from('customers');
		$q = $this->db->get();
		if($q->num_rows() > 0) {
			foreach (($q->result()) as $row) {
				$data[] = $row;
			}
				
			return $data;
		}
	}
        
            public function getAllProduct() 
	{
		$this->db->select('*')->from('products');
		$q = $this->db->get();
		if($q->num_rows() > 0) {
			foreach (($q->result()) as $row) {
				$data[] = $row;
			}
				
			return $data;
		}
	}
        
        
        public function addCustomerDiscount($data)
	{

			$discountData = array(
				'customer_id'	     	=> $data['customer_id'],
                                'product_id'	     	=> $data['product_id'],
				'discount_amount' 	=> $data['discount'],
				'discount_type' 	=> $data['type'] 
			);

		if($this->db->insert('customer_discount', $discountData)) {
			return true;
		} else {
			return false;
		}
	}
        
        
        public function getAllCustomerDiscounts() 
	{       


            
		$myQuery ='SELECT customer_discount.*, customers.name as customer_name, products.name as product_name
                       FROM customer_discount
                       LEFT JOIN customers ON customers.id=customer_discount.customer_id
                       LEFT JOIN products ON products.id=customer_discount.product_id';  
                
                
                $q = $this->db->query($myQuery, false); 
                
		if($q->num_rows() > 0) {
			foreach (($q->result()) as $row) {
				$data[] = $row;
			}
				
			return $data;
		}
     
	}
        
        public function deleteCustomerDiscount($id)  
	{
            
            
		if($this->db->delete('customer_discount', array('customer_discount_id' => $id))) { 
			return true;
		}
	return FALSE;
	}
        
        
        
        public function getCustomerDiscountByID($id)  
	{ 
            
            
            $myQuery ="SELECT customer_discount.*, customers.name as customer_name, products.name as product_name
                       FROM customer_discount
                       LEFT JOIN customers ON customers.id=customer_discount.customer_id
                       LEFT JOIN products ON products.id=customer_discount.product_id
                       WHERE customer_discount.customer_discount_id = $id ";  
            
            $q = $this->db->query($myQuery, false); 
            
		//$q = $this->db->get_where('customer_discount', array('customer_discount_id' => $id), 1); 
                
		  if( $q->num_rows() > 0 )
		  {
			return $q->row();
		  } 
		
		  return FALSE;

	}
        
        
        public function updateCustomerDiscount($id, $data = array())
	{ 
		
		$discountData = array(
				'customer_id'	     	=> $data['customer_id'],
                                'product_id'	     	=> $data['product_id'],
				'discount_amount' 	=> $data['discount'],
				'discount_type' 	=> $data['type'] 
			);
                
                //echo $id; exit; 
               // print_r($discountData);exit; 
			
		$this->db->where('customer_id', $data['customer_id']);
		$this->db->where('product_id', $data['product_id']); 
		if($this->db->update('customer_discount', $discountData)) {
			return true;
		} else {
			return false;
		}
	}
        
        
        
        public function checkDuplicateDiscount($customer_id, $product_id )  
	{ 
            
            //echo $customer_id; echo " "; echo $product_id; exit; 
            
            
            $myQuery ="SELECT * 
                       FROM customer_discount
                       WHERE customer_id = $customer_id   
                       AND product_id = $product_id ";  
            
            $q = $this->db->query($myQuery, false); 
            
		//$q = $this->db->get_where('customer_discount', array('customer_discount_id' => $id), 1); 
                
		  if( $q->num_rows() > 0 )  
		  {
			return True;
                  }else{
                       return FALSE; 
                  } 

	}
	
		
}
