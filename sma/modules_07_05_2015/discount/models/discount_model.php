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
        
        
        public function updateCustomerBalance($data)
	{
            //print_r($data);exit;  
            
                  /*    $dateOfUpdate = date("Y-m-d"); 
            
			$transData = array(
				'customer_id'	     	=> $data['customer_id'],
                                'amount'	     	=> $data['amount'],   
				'transaction_type' 	=> 'added',
                                'date'          	=> $dateOfUpdate 
			);

		if($this->db->insert('transaction_history', $transData)) {        */    
                    
                    if($data!='') { 
                        
                     $customer_id=$data['customer_id'];      
                     $cusBalance = $this->discount_model->getCustomerBalancebyID($customer_id);         
                  
                     $customer_balance = $cusBalance->customer_balance;  
                     $date = $cusBalance->date;     
                     
                     //print_r($data);exit;      
                     
                     $actionType=$data['action_type']; 
                     
                     if($actionType=='payment_in'){
                          $present_balance = ($customer_balance + $data['payment']);      
                     }elseif($actionType=='deduct_amount'){
                          $present_balance = ($customer_balance - $data['payment']);   
                     }else{
                          $present_balance = ($customer_balance - $data['payment']);   
                     } 
                     
                     $updatedate = date("Y-m-d"); 

                     $cusBalanceData = array(
                            'customer_balance'			=> $present_balance,  
                            'date'			        => $updatedate,  
                            );
                     
                     $this->db->update('customer_balance', $cusBalanceData, array('customer_id' => $customer_id));


			return true;
		} else {
			return false;
		}
	}
        
         public function getCustomerBalancebyID($customer_id) {     
       
             
            //$myQuery = "Select DISTINCT(customer_balance), date from customer_balance where customer_id= $customer_id ORDER BY date DESC LIMIT 1 ";

             $myQuery = "Select * from customer_balance where customer_id= $customer_id ";
             
               $q = $this->db->query($myQuery, false);
               if( $q->num_rows() > 0 ){
                   return $q->row();
               } else {
                   return 0;
               }
           }
           
           
           
       public function getAllCustomerBalance()   
	{       
		$myQuery ='SELECT customer_balance.*, customers.name as customer_name
                       FROM customer_balance
                       LEFT JOIN customers ON customers.id=customer_balance.customer_id 
                       ORDER BY customer_balance.customer_balance_id DESC
                ';  
                $q = $this->db->query($myQuery, false); 
		if($q->num_rows() > 0) {
			foreach (($q->result()) as $row) {
				$data[] = $row;
			}
			return $data;
		}
	}   
           
  
        
        public function deleteCustomerBalance($id)  
	{
            
            
		if($this->db->delete('transaction_history', array('transaction_history_id' => $id))) { 
			return true;
		}
	return FALSE;
	}
        
        
       public function getCustomerBalanceHistoryByID($dataItem) {         
             
           $customer_id=$dataItem['customer_id'];
           $start_date=$dataItem['start_date'];
           $end_date=$dataItem['end_date']; 
           
           
            $myQuery = "SELECT transaction_history.*, customers.name
                        FROM transaction_history
                        LEFT JOIN customers ON customers.id = transaction_history.customer_id
                        WHERE transaction_history.customer_id = $customer_id
                        AND transaction_history.date
                        BETWEEN '$start_date' AND '$end_date' 
                        ORDER BY transaction_history.transaction_history_id DESC ";  

                $q = $this->db->query($myQuery, false);  
                
		if($q->num_rows() > 0) {
			foreach (($q->result()) as $row) {
				$data[] = $row;
			}
				
			return $data;
		}
       }
       
       
       
     /* public function getCustomerTransactionByID($dataItem) {         
             
            $customer_id=$dataItem['customer_id'];
            $myQuery = "SELECT *
                        FROM sales
                        WHERE customer_id=$customer_id 
                        ORDER BY id DESC ";  

                $q = $this->db->query($myQuery, false);  
                
		if($q->num_rows() > 0) {
			foreach (($q->result()) as $row) {
				$data[] = $row;
			}
				
			return $data;
		}
       } */ 
       
       
     /*  public function getCustomerTransactionByID($dataItem) {           
             
            $customer_id=$dataItem['customer_id'];
            $start_date=$dataItem['start_date']; 
            $end_date=$dataItem['end_date'];
            $all_history=$dataItem['all_history']; 
            
            $con = "where 1 transaction_history.customer_id=$customer_id";
            
            if($all_history!=''){
                
                $con.=" and ";
                
            }
            
            $myQuery = "SELECT transaction_history.*,customers.name
                        FROM transaction_history
                        LEFT JOIN customers ON customers.id=transaction_history.customer_id
                        WHERE transaction_history.customer_id=$customer_id
                        AND transaction_history.date
                        BETWEEN '$start_date' AND '$end_date' 
                        ORDER BY transaction_history.transaction_history_id ASC ";  

                $q = $this->db->query($myQuery, false);  
                
		if($q->num_rows() > 0) {
			foreach (($q->result()) as $row) {
				$data[] = $row;
			}
			return $data;
		}
        }  */
        
       
       
         public function getTransactionHistory() {           
      
            $myQuery = "SELECT transaction_history.*,customers.name
                        FROM transaction_history
                        LEFT JOIN customers ON customers.id=transaction_history.customer_id
                        ORDER BY transaction_history.transaction_history_id ASC ";  

                $q = $this->db->query($myQuery, false);  
                
		if($q->num_rows() > 0) {
			foreach (($q->result()) as $row) {
				$data[] = $row;
			}
			return $data;
		}
        } 
       
       
       public function getCustomerTransactionByID($dataItem) {           
             
            $customer_id=$dataItem['customer_id'];
            $start_date=$dataItem['start_date']; 
            $end_date=$dataItem['end_date'];
            $all_history=$dataItem['all_history'];

            $con = "where 1";
            
            if($all_history!=''){
                $con.=" and transaction_history.customer_id=$customer_id";
            }else{
                
                $con.=" and transaction_history.customer_id=$customer_id AND transaction_history.date
                        BETWEEN '$start_date' AND '$end_date' ";
            }
                
            
            $myQuery = "SELECT transaction_history.*,customers.name
                        FROM transaction_history
                        LEFT JOIN customers ON customers.id=transaction_history.customer_id
                        $con
                        ORDER BY transaction_history.transaction_history_id ASC ";  

                $q = $this->db->query($myQuery, false);  
                
		if($q->num_rows() > 0) {
			foreach (($q->result()) as $row) {
				$data[] = $row;
			}
			return $data;
		}
        } 
        
        
        
        
        
       
       
        public function insertCustomerBalance($data)
	{ 
            $customer_id=$data['customer_id'];
            $typeOfAction=$data['action_type'];
            $cusLatestBill = $this->discount_model->getCustomerLatestBill($customer_id);      
            $cus_latest_bill=$cusLatestBill->total_balance; 
            $current_balance= $cus_latest_bill - $data['payment'];
            $dateOfupdate= date("d/m/Y"); 
            
            
                   if($typeOfAction=='payment_in'){  
                       
			$discountData = array(
				'customer_id'	     	=> $data['customer_id'],
				'action_type' 	        => 'Payment In',
                                'commence_date'         => $data['commence_date'],
                                'payment'	     	=> $data['payment'],
                                'paid_by'               => $data['paid_by'],
                                'total_balance'         => $current_balance,
                                'pre_balance'           => $cus_latest_bill,
                                'note'                  => $data['note'],
                                'date'                  => $dateOfupdate
			);
                   }elseif($typeOfAction =='deduct_amount') {
                       
                       $current_balanceFor_deduct= $cus_latest_bill - $data['payment'];      
                       
                        	$discountData = array(
				'customer_id'	     	=> $data['customer_id'],
				'action_type' 	        => 'Deduct Balance',
                                'less'	     	        => $data['payment'], 
                                'total_balance'         => $current_balanceFor_deduct, 
                                'pre_balance'           => $cus_latest_bill,
                                'note'                  => $data['note'],
                                'date'                  => $dateOfupdate
			); 
                   }else{
                     
                         $current_balanceFor_charge = $cus_latest_bill + $data['payment']; 
                       	$discountData = array(
                            
				'customer_id'	     	=> $data['customer_id'], 
				'action_type' 	        => 'Charge Added', 
                                'charge'	        => $data['payment'],
                                'total_balance'         => $current_balanceFor_charge, 
                                'pre_balance'           => $cus_latest_bill,
                                'note'                  => $data['note'],
                                'date'                  => $dateOfupdate
			);
                       
                   }
                   
                  //print_r($discountData);exit;   

		if($this->db->insert('transaction_history', $discountData)) {
                    
                     $cusLatestSalData=$this->discount_model->getCustomerLatestSaleID($customer_id);
                     $transidOfLatestInvoice=$cusLatestSalData->transaction_history_id;  
                     $paymentDataForInvoice = array(
				'latest_payment'  => $data['payment'],   
			);
                     $this->db->update('transaction_history', $paymentDataForInvoice, array('transaction_history_id' => $transidOfLatestInvoice));
                     
                    
                     $cusLatestBill = $this->discount_model->getCustomerLatestBill($customer_id);      
                     $cus_latest_bill=$cusLatestBill->total_balance;            
                     
                     $balanceData = array(
				'total_balance_amount'  => $cus_latest_bill,   
			);
                     
                     $this->db->update('customer_balance', $balanceData, array('customer_id' => $customer_id));
                     
			return true;     
		} else {
			return false;
		}
	}
        
        
        
        
        
        
        
        
   public function getCustomerLatestBill($custid) {     
         
     $myQuery = "Select total_balance from transaction_history where customer_id= $custid ORDER BY transaction_history_id DESC LIMIT 1 ";
       
        $q = $this->db->query($myQuery, false);
	if( $q->num_rows() > 0 ){
            return $q->row();
        } else {
            return 0;
        }
    }
    
    
          public function getCustomerInfoByID($customer_id) {      
       
                $myQuery = "Select customers.*, customer_balance.*
                            from customers
                            left join customer_balance ON customer_balance.customer_id=customers.id
                            where id= $customer_id ";

                  $q = $this->db->query($myQuery, false);
                  if( $q->num_rows() > 0 ){
                      return $q->row();
                  } else {
                      return 0;
                  }
         }
           
           
           ////////////////////////// For Invoice//////////////////
           
        public function getAllInvoiceItemsWithDetails($sale_id) 
	{
            
            $this->db->select('sale_items.id, sale_items.product_name, sale_items.product_code, sale_items.quantity, sale_items.serial_no, sale_items.tax, sale_items.unit_price, sale_items.val_tax, sale_items.discount_val, sale_items.gross_total, sale_items.sale_product_weight,sale_items.variprod_note, products.details, products.weight');	
            $this->db->join('products', 'products.id=sale_items.product_id', 'left');
            $this->db->order_by('id', 'asc');
		$q = $this->db->get_where('sale_items', array('sale_id' => $sale_id));
		if($q->num_rows() > 0) {
			foreach (($q->result()) as $row) {
				$data[] = $row;
                                
                                //print_r($data[]); exit; 
			}
				
			return $data;
		}
	}
        
        
        public function getInvoiceBySaleID($sale_id)
	{

		$q = $this->db->get_where('sales', array('id' => $sale_id), 1); 
		  if( $q->num_rows() > 0 )
		  {
			return $q->row();
		  } 
		
		  return FALSE;
	}
        
        
        public function getBillerByID($id) 
	{ 
		$q = $this->db->get_where('billers', array('id' => $id), 1); 
		  if( $q->num_rows() > 0 )
		  { 
			return $q->row();
		  } 
		  return FALSE;
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
        
        public function getInvoiceTypeByID($id) 
	{
		$q = $this->db->get_where('invoice_types', array('id' => $id), 1); 
		  if( $q->num_rows() > 0 )
		  {
			return $q->row();
		  } 
		
		  return FALSE;

	}
     
      //////////////// Invoice End/////////////////    

     /////////////////29=04=2015//////////
  
        public function getCustomerLatestBalancebyID($custid) {

        //$myQuery = "Select DISTINCT(customer_balance), date from customer_balance where customer_id= $custid ORDER BY date DESC LIMIT 1 ";

        $myQuery = "SELECT total_balance
                    FROM transaction_history
                    WHERE customer_id= $custid
                    ORDER BY transaction_history_id DESC 
                    LIMIT 1, 1";
        
        $q = $this->db->query($myQuery, false);
        if ($q->num_rows() > 0) {
            return $q->row();
        } else {
            return 0;
        }
    }

    public function getCustomerPreBalancebyID($sale_id,$custid) {

        $myQuery = "SELECT pre_balance
                    FROM transaction_history
                    WHERE customer_id= $custid
                    AND sale_id=$sale_id
                    LIMIT 0, 1";
        
        $q = $this->db->query($myQuery, false);
        if ($q->num_rows() > 0) {
            return $q->row();
        } else {
            return 0;
        }
    }
    
           
    public function getPaymentForInvoice($sale_id) {

        $myQuery = "SELECT latest_payment,transaction_history_id
                    FROM transaction_history
                    WHERE sale_id= $sale_id
                    LIMIT 0, 1";
        
        $q = $this->db->query($myQuery, false);
        if ($q->num_rows() > 0) {
            return $q->row();
        } else {
            return 0;
        }
    }
    
    
        public function getCustomerLatestSaleID($customer_id) {

        $myQuery = "SELECT transaction_history_id
                    FROM transaction_history
                    WHERE customer_id= $customer_id
                    AND sale_id != ''
                    ORDER BY transaction_history_id DESC     
                    LIMIT 0, 1";
        
        $q = $this->db->query($myQuery, false);
        if ($q->num_rows() > 0) {
            return $q->row();
        } else {
            return 0;
        }
    }
        
	
		
}