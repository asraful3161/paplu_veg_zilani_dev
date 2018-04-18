<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Discount extends MX_Controller {

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
| MODULE: 			Sales
| -----------------------------------------------------
| This is sales module controller file.
| -----------------------------------------------------
*/

	 
	function __construct()
	{
		parent::__construct();
		
		// check if user logged in 
		if (!$this->ion_auth->logged_in())
	  	{
			redirect('module=auth&view=login');
	  	}
		$this->load->library('form_validation');
		$this->load->model('discount_model'); 

	}
/* -------------------------------------------------------------------------------------------------------------------------------- */
//index or inventories page

   function customer_discounts()
   {
	  $data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');
	  $data['success_message'] = $this->session->flashdata('success_message');
	   
	  $data['customer_discounts'] = $this->discount_model->getAllCustomerDiscounts(); 
          
          //print_r($data['customer_discounts']); exit;  
           
          $meta['page_title'] = 'Customer Discount';        
          $data['page_title'] = 'Customer Discount List';  
          $this->load->view('commons/header', $meta);          
          $this->load->view('customer_discounts', $data);     
          $this->load->view('commons/footer');                
   }
   
   
   function add()
   { 
       
                $this->form_validation->set_rules('customer_id', Customer, 'required|xss_clean');
		$this->form_validation->set_rules('product_id', Product, 'required|xss_clean');
		$this->form_validation->set_rules('discount', $this->lang->line('discount'), 'required|xss_clean');
		$this->form_validation->set_rules('type', $this->lang->line('type'), 'required|is_natural_no_zero|xss_clean');
		
		
		if ($this->form_validation->run() == true)
		{
			$data = array(
				'customer_id' => $this->input->post('customer_id'),
                                'product_id' => $this->input->post('product_id'), 
                                'discount' => $this->input->post('discount'), 
				'type' => $this->input->post('type')
			);
                        
                        
                        
                        $customer_id=$this->input->post('customer_id'); 
                        $product_id=$this->input->post('product_id');
                
                        $result=$this->discount_model->checkDuplicateDiscount($customer_id, $product_id );
                        
                  
                        
                        if($result==false){  
                            
                            $this->discount_model->addCustomerDiscount($data);                           
                            $this->session->set_flashdata('success_message', $this->lang->line('discount_added'));
                            redirect("module=discount&view=customer_discounts", 'refresh'); 
                          
                        }
                        else
                        {
                   
                        $customer_discuount_id=$result->customer_discuount_id;   

                        $this->discount_model->updateCustomerDiscount($customer_discuount_id, $data);  

                        $this->session->set_flashdata('success_message', $this->lang->line('discount_updated'));
                        redirect("module=discount&view=customer_discounts", 'refresh'); 
                    
                        }
		}
                else
                {

                $data['message'] = (validation_errors() ? validation_errors() : $this->session->flashdata('message'));
                $data['success_message'] = $this->session->flashdata('success_message');
                $data['customer'] = $this->discount_model->getAllCustomer();
                $data['product'] = $this->discount_model->getAllProduct();
                $meta['page_title'] = 'Customer Discount';
                $data['page_title'] = 'Customer Discount'; 
                $this->load->view('commons/header', $meta);
                $this->load->view('add',$data); 
                $this->load->view('commons/footer');

                }
             
     }
     
       function delete_discount($id = NULL)
	{

			if(DEMO) { 
				$this->session->set_flashdata('message', $this->lang->line('disabled_in_demo'));
				redirect("module=home", 'refresh');
			}
			
		if($this->input->get('id')){ $id = $this->input->get('id'); }
		
		if ( $this->discount_model->deleteCustomerDiscount($id) )
		{ 
			$this->session->set_flashdata('success_message', $this->lang->line("discount_deleted"));
			redirect('module=discount&view=customer_discounts', 'refresh');
		}
		
	}
        
        
   function edit_customer_discount() 
   { 
              
                if($this->input->get('id')){ $id = $this->input->get('id'); }
       
                $this->form_validation->set_rules('customer_id', Customer, 'required|xss_clean');
		$this->form_validation->set_rules('product_id', Product, 'required|xss_clean');
		$this->form_validation->set_rules('discount', $this->lang->line('discount'), 'required|xss_clean');
		$this->form_validation->set_rules('type', $this->lang->line('type'), 'required|is_natural_no_zero|xss_clean');
		
		
		if ($this->form_validation->run() == true)
		{
                        $id=$this->input->post('customer_discount_id');
                    
			$data = array(
                            
				'customer_id' => $this->input->post('customer_id'),
                                'product_id' => $this->input->post('product_id'), 
                                'discount' => $this->input->post('discount'), 
				'type' => $this->input->post('type')
			);
		}
		
                //echo $id; exit; 
                
		if ( $this->form_validation->run() == true && $this->discount_model->updateCustomerDiscount($id, $data))
		{ 
			$this->session->set_flashdata('success_message', $this->lang->line('discount_updated')); 
			redirect("module=discount&view=customer_discounts", 'refresh'); 
		}
		else
		{
				
                $data['message'] = (validation_errors() ? validation_errors() : $this->session->flashdata('message'));
                $data['success_message'] = $this->session->flashdata('success_message');
                
                $data['customer_discount'] = $this->discount_model->getCustomerDiscountByID($id);  
                
                //print_r($data['customer_discount']); exit;  
                
                $meta['page_title'] = 'Customer Discount Update';
                $data['page_title'] = 'Customer Discount Update'; 
                $this->load->view('commons/header', $meta);
                $this->load->view('edit_customer_discount',$data);  
                $this->load->view('commons/footer');
            
                }
            
     }
   
 
	
}