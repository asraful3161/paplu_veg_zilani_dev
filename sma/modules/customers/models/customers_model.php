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
| MODULE: 			Customers
| -----------------------------------------------------
| This is customers module's model file.
| -----------------------------------------------------
*/


class Customers_model extends CI_Model
{
	
	
	public function __construct()
	{
		parent::__construct();

	}
	
	public function getAllCustomers() 
	{
		$q = $this->db->get('customers');
		if($q->num_rows() > 0) {
			foreach (($q->result()) as $row) {
				$data[] = $row;
			}
				
			return $data;
		}
	}
	
	public function customers_count() {
        return $this->db->count_all("customers");
    }

    public function fetch_customers($limit, $start) {
        $this->db->limit($limit, $start);
		$this->db->order_by("id", "desc"); 
        $query = $this->db->get("customers");

        if ($query->num_rows() > 0) {
            foreach ($query->result() as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return false;
   }
	
	public function getCustomerByID($id) 
	{

		$q = $this->db->get_where('customers', array('id' => $id), 1); 
		  if( $q->num_rows() > 0 )
		  {
			return $q->row();
		  } 
		
		  return FALSE;

	}
	
	public function getCustomerByEmail($email) 
	{

		$q = $this->db->get_where('customers', array('email' => $email), 1); 
		  if( $q->num_rows() > 0 )
		  {
			return $q->row();
		  } 
		
		  return FALSE;

	}
	
	public function addCustomer($data=[], $customer_balance){

		//var_dump($data);die;

		if($this->db->insert('customers', $data)){
                    
            $customer_id=$this->db->insert_id();
            $dateOfupdate= date("d/m/Y");
                    
            $customerBalanceData=[
		    	'customer_id'=> $customer_id, 
		    	'customer_balance'=> $customer_balance,
                'total_balance_amount'=> '0.00',
                'date'=> $dateOfupdate
		    ];
                      
            $this->db->insert('customer_balance', $customerBalanceData);  
                      
            $customerHistoryData=[
		    	'customer_id'=> $customer_id,  
		    	'total_balance'=> '0.00',
                'date'=> $dateOfupdate
		    ]; 
                       
            $this->db->insert('transaction_history', $customerHistoryData);

			return true;
		}

		return false;
	}
	
	public function updateCustomer($id, $data = array())
	{
		
		// Customer data
		$customerData = array(
		        'name'	     	                => $data['name'],
		        'email'   		        => $data['email'],
			'company'      		        => $data['company'],
		        'address' 			=> $data['address'],
			'city'	     	                => $data['city'],
		        'postal_code'   	        => $data['postal_code'], 
		        'mobile' 			=> $data['mobile'], 
			'phone'	     	                => $data['phone']
		);
		
		$this->db->where('id', $id);
		if($this->db->update('customers', $customerData)) {
			return true;
		} else {
			return false;
		}
	}
	
	public function add_customers($data = array())
	{
		
		if($this->db->insert_batch('customers', $data)) {
			return true;
		} else {
			return false;
		}
	}
	
	public function deleteCustomer($id) 
	{
		if($this->db->delete('customers', array('id' => $id))) {
			return true;
		}
	return FALSE;
	}
	
	public function getCustomerNames($term)
    {
	   	$this->db->select('name');
	   	$this->db->select('id');
	    $this->db->like('name', $term, 'both');
   		$q = $this->db->get('customers');
		if($q->num_rows() > 0) {
			foreach (($q->result()) as $row) {
				$data[] = $row;
			}
			//print_r($data);	
                        //exit();
			return $data; 
		}
    }

}
