<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Discount extends MX_Controller
{
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
        error_reporting(E_ALL);

        // check if user logged in 
        if (!$this->ion_auth->logged_in()) {
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

        $data['customer_discounts'] = $this->discount_model->getAllCustomerDiscounts()?$this->discount_model->getAllCustomerDiscounts():[];

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


        if ($this->form_validation->run() == true) {
            $data = array(
                'customer_id' => $this->input->post('customer_id'),
                'product_id' => $this->input->post('product_id'),
                'discount' => $this->input->post('discount'),
                'type' => $this->input->post('type')
            );



            $customer_id = $this->input->post('customer_id');
            $product_id = $this->input->post('product_id');

            $result = $this->discount_model->checkDuplicateDiscount($customer_id, $product_id);



            if ($result == false) {

                $this->discount_model->addCustomerDiscount($data);
                $this->session->set_flashdata('success_message', $this->lang->line('discount_added'));
                redirect("module=discount&view=customer_discounts", 'refresh');
            } else {

                $customer_discuount_id = $result->customer_discuount_id;

                $this->discount_model->updateCustomerDiscount($customer_discuount_id, $data);

                $this->session->set_flashdata('success_message', $this->lang->line('discount_updated'));
                redirect("module=discount&view=customer_discounts", 'refresh');
            }
        } else {

            $data['message'] = (validation_errors() ? validation_errors() : $this->session->flashdata('message'));
            $data['success_message'] = $this->session->flashdata('success_message');
            $data['customer'] = $this->discount_model->getAllCustomer();
            $data['product'] = $this->discount_model->getAllProduct();
            $meta['page_title'] = 'Customer Discount';
            $data['page_title'] = 'Customer Discount';
            $this->load->view('commons/header', $meta);
            $this->load->view('add', $data);
            $this->load->view('commons/footer');
        }
    }

    function delete_discount($id = NULL)
    {

        if (DEMO) {
            $this->session->set_flashdata('message', $this->lang->line('disabled_in_demo'));
            redirect("module=home", 'refresh');
        }

        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }

        if ($this->discount_model->deleteCustomerDiscount($id)) {
            $this->session->set_flashdata('success_message', $this->lang->line("discount_deleted"));
            redirect('module=discount&view=customer_discounts', 'refresh');
        }
    }

    function edit_customer_discount()
    {

        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }

        $this->form_validation->set_rules('customer_id', Customer, 'required|xss_clean');
        $this->form_validation->set_rules('product_id', Product, 'required|xss_clean');
        $this->form_validation->set_rules('discount', $this->lang->line('discount'), 'required|xss_clean');
        $this->form_validation->set_rules('type', $this->lang->line('type'), 'required|is_natural_no_zero|xss_clean');


        if ($this->form_validation->run() == true) {
            $id = $this->input->post('customer_discount_id');

            $data = array(
                'customer_id' => $this->input->post('customer_id'),
                'product_id' => $this->input->post('product_id'),
                'discount' => $this->input->post('discount'),
                'type' => $this->input->post('type')
            );
        }

        //echo $id; exit; 

        if ($this->form_validation->run() == true && $this->discount_model->updateCustomerDiscount($id, $data)) {
            $this->session->set_flashdata('success_message', $this->lang->line('discount_updated'));
            redirect("module=discount&view=customer_discounts", 'refresh');
        } else {

            $data['message'] = (validation_errors() ? validation_errors() : $this->session->flashdata('message'));
            $data['success_message'] = $this->session->flashdata('success_message');

            $data['customer_discount'] = $this->discount_model->getCustomerDiscountByID($id);

            //print_r($data['customer_discount']); exit;  

            $meta['page_title'] = 'Customer Discount Update';
            $data['page_title'] = 'Customer Discount Update';
            $this->load->view('commons/header', $meta);
            $this->load->view('edit_customer_discount', $data);
            $this->load->view('commons/footer');
        }
    }

    /* function update_customer_balance()
      {

      $this->form_validation->set_rules('customer_id', $this->lang->line("customer_id"), 'required|xss_clean');
      $this->form_validation->set_rules('amount', $this->lang->line("amount"), 'required|xss_clean');



      if ($this->form_validation->run() == true)
      {
      $data = array('customer_id' => $this->input->post('customer_id'),
      'amount' => $this->input->post('amount'),
      'action_type' => $this->input->post('action_type'),
      );
      }

      if ( $this->form_validation->run() == true && $this->discount_model->updateCustomerBalance($data))
      { //check to see if we are creating the customer
      //redirect them back to the admin page
      $this->session->set_flashdata('success_message', 'Customer Balance Added');
      redirect("module=discount&view=list_customer_balance", 'refresh');
      }
      else
      { //display the create customer form
      //set the flash data error message if there is one
      $data['message'] = (validation_errors() ? validation_errors() : $this->session->flashdata('message'));

      $data['customer'] = array('name' => 'customer',
      'id' => 'customer',
      'type' => 'text',
      'value' => $this->form_validation->set_value('customer'),
      );
      $data['amount'] = array('name' => 'amount',
      'id' => 'amount',
      'type' => 'text',
      'value' => $this->form_validation->set_value('amount'),
      );


      $meta['page_title'] = 'Customer Balance';
      $data['page_title'] = 'Customer Balance';
      $this->load->view('commons/header', $meta);
      $this->load->view('update_customer_balance', $data);
      $this->load->view('commons/footer');

      }
      }

     */

    function update_customer_balance()
    {

        $action_type = $this->input->post('action_type');

        if ($action_type == 'deduct_amount' || $action_type == 'add_charge') {
            $this->form_validation->set_rules('note', Note, 'required|xss_clean');
        }


        $this->form_validation->set_rules('customer_id', $this->lang->line("customer_id"), 'required|xss_clean');
        $this->form_validation->set_rules('amount', $this->lang->line("amount"), 'required|xss_clean');
        $this->form_validation->set_rules('paid_by', $this->lang->line("paid_by"), 'required|xss_clean');


        if ($this->form_validation->run() == true) {
            $data = array('customer_id' => $this->input->post('customer_id'),
                'action_type' => $this->input->post('action_type'),
                'commence_date' => $this->input->post('commence_date'),
                'payment' => $this->input->post('amount'),
                'paid_by' => $this->input->post('paid_by'),
                'note' => $this->input->post('note'),
            );

            $insert_result = $this->discount_model->insertCustomerBalance($data);
        }




        if ($this->form_validation->run() == true && $this->discount_model->updateCustomerBalance($data)) { //check to see if we are creating the customer
            //redirect them back to the admin page
            $this->session->set_flashdata('success_message', 'Balance Update Successful.');
            //redirect("module=discount&view=list_customer_balance", 'refresh'); 
            redirect("module=discount&view=customer_transaction_history", 'refresh');
        } else { //display the create customer form
            //set the flash data error message if there is one
            $data['message'] = (validation_errors() ? validation_errors() : $this->session->flashdata('message'));

            $data['customer'] = array('name' => 'customer',
                'id' => 'customer',
                'type' => 'text',
                'value' => $this->form_validation->set_value('customer'),
            );
            $data['amount'] = array('name' => 'amount',
                'id' => 'amount',
                'type' => 'text',
                'value' => $this->form_validation->set_value('amount'),
            );
            $data['note'] = array('name' => 'note',
                'id' => 'note',
                'type' => 'text',
                'value' => $this->form_validation->set_value('note'),
            );


            $meta['page_title'] = 'Customer Balance';
            $data['page_title'] = 'Customer Balance';

            redirect('module=discount&view=customer_transaction_history', $meta, $data);


            //$this->load->view('commons/header', $meta);
            //$this->load->view('update_customer_balance', $data);
            //$this->load->view('commons/footer');
        }
    }

    function list_customer_balance()
    {

        //echo $result = rand(485000000000, 485999999999); exit;           


        $data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');
        $data['success_message'] = $this->session->flashdata('success_message');

        $data['customer_balance'] = $this->discount_model->getAllCustomerBalance()?$this->discount_model->getAllCustomerBalance():[];

        //print_r($data['customer_balance']); exit;   

        $meta['page_title'] = 'Customer Balance';
        $data['page_title'] = 'Customer Balance List';
        $this->load->view('commons/header', $meta);
        $this->load->view('customer_balance', $data);
        $this->load->view('commons/footer');
    }

    function delete_balance($id = NULL)
    {
        if (DEMO) {
            $this->session->set_flashdata('message', $this->lang->line('disabled_in_demo'));
            redirect("module=home", 'refresh');
        }

        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }

        if ($this->discount_model->deleteCustomerBalance($id)) {
            $this->session->set_flashdata('success_message', 'Balance Deleted');
            redirect('module=discount&view=list_customer_balance', 'refresh');
        }
    }

    function getCustomerBalance()
    {

        $customer_id = $this->input->get('selectedcusid');

        //$cusBalance = $this->discount_model->getCustomerBalancebyID($customer_id);    
        //$customer_balance = $cusBalance->customer_balance;

        $cusLatestBill = $this->discount_model->getCustomerLatestBill($customer_id);
        $cus_latest_bill = $cusLatestBill->total_balance;

        $data = array('balance' => $cus_latest_bill);
        echo json_encode($data);
    }

    function customer_balance_history()
    {


        $this->form_validation->set_rules('customer_id', $this->lang->line("customer_id"), 'required|xss_clean');
        $this->form_validation->set_rules('start_date', $this->lang->line("start_date"), 'required|xss_clean');
        $this->form_validation->set_rules('end_date', $this->lang->line("end_date"), 'required|xss_clean');


        if ($this->form_validation->run() == true) { //check to see if we are creating the customer
            //redirect them back to the admin page
            $dataItem = array('customer_id' => $this->input->post('customer_id'),
                'start_date' => $this->input->post('start_date'),
                'end_date' => $this->input->post('end_date'),
            );

            $data['customer_balance_history'] = $this->discount_model->getCustomerBalanceHistoryByID($dataItem);

            //print_r($data['customer_balance_history']); exit; 

            $this->session->set_flashdata('success_message', 'Customer Balance Added');
            $meta['page_title'] = 'Customer Balance';
            $data['page_title'] = 'Customer Balance';
            $this->load->view('commons/header', $meta);
            $this->load->view('viewlist_customer_balance_history', $data);
            $this->load->view('commons/footer');
        } else { //display the create customer form
            //set the flash data error message if there is one
            $data['message'] = (validation_errors() ? validation_errors() : $this->session->flashdata('message'));

            $data['customer_id'] = array('name' => 'customer_id',
                'id' => 'customer_id',
                'type' => 'text',
                'value' => $this->form_validation->set_value('customer_id'),
            );
            $data['start_date'] = array('name' => 'start_date',
                'id' => 'start_date',
                'type' => 'text',
                'value' => $this->form_validation->set_value('start_date'),
            );

            $data['end_date'] = array('name' => 'end_date',
                'id' => 'end_date',
                'type' => 'text',
                'value' => $this->form_validation->set_value('end_date'),
            );

            $meta['page_title'] = 'Customer Balance ';
            $data['page_title'] = 'View Customer Balance';


            //redirect('module=discount&view=customer_transaction_history',$meta, $data);

            $this->load->view('commons/header', $meta);
            $this->load->view('customer_balance_history', $data);
            $this->load->view('customer_transaction_history', $data);
            $this->load->view('commons/footer');
        }
    }

    function customer_transaction_history()
    {
        // echo "string"; exit; 
        //$data['customer_transavtion_history']=$this->discount_model->getTransactionHistory($dataItem);
        //$data['customerData']=$this->discount_model->getCustomerInfoByID(12);
        //print_r($data['customerData']); exit; 

        $data['customer_transavtion_history'] = $this->discount_model->getTransactionHistory()?$this->discount_model->getTransactionHistory():[];
        // echo "<pre>"; print_r($data['customer_transavtion_history']); exit; 

        $this->session->set_flashdata('success_message', 'Balance successfully updated');
        $data['customerData'] = '';
        $data['success_message'] = '';
        $data['message'] = '';


        $meta['page_title'] = 'View Transaction History';
        $data['page_title'] = 'Transaction History';
        $this->load->view('commons/header', $meta);
        $this->load->view('customer_transaction_history', $data);
        //$this->load->view('customer_transaction_history_full', $data);
        //$this->load->view('viewlist_customer_transaction_history', $data);
        $this->load->view('commons/footer');
    }

    function view_customer_transaction_history(){

    	// var_dump($this->input->post()); exit; 
        //$data['success_message']='';
        //$data['message']=''; 

        if ($this->input->post('start_date') && $this->input->post('end_date')) {
            $this->form_validation->set_rules('start_date', $this->lang->line("start_date"), 'required|xss_clean');
            $this->form_validation->set_rules('end_date', $this->lang->line("end_date"), 'required|xss_clean');
        }

        if ($this->input->post('all_history')) {
            $this->form_validation->set_rules('all_history', 'All History', 'required|xss_clean');
        }

        $this->form_validation->set_rules('customer_id', $this->lang->line("customer"), 'required|xss_clean');

        // var_dump($this->form_validation->run()); exit; 
        if ($this->form_validation->run() == true) { //check to see if we are creating the customer
            //redirect them back to the admin page
            $customerId = $this->input->post('customer_id');
            $this->session->set_userdata('cusIdForBalanceUpdate', $customerId);

            $dataItem = array('customer_id' => $this->input->post('customer_id'),
                'start_date' => $this->input->post('start_date'),
                'end_date' => $this->input->post('end_date'),
                'all_history' => $this->input->post('all_history'),
            );

            $data['customer_transavtion_history'] = $this->discount_model->getCustomerTransactionByID($dataItem);
            // echo "<pre>"; print_r($dataItem); print_r($data['customer_transavtion_history']);exit;
            $data['customerData'] = $this->discount_model->getCustomerInfoByID($customerId);
            //print_r($data['customerData']);exit;
            $customer_name = $data['customerData']->name;
            $this->session->set_userdata('cusNameForBalanceUpdate', $customer_name);

            $this->session->set_flashdata('success_message', 'Customer Balance Updated');
            $meta['page_title'] = 'View Transaction History';
            $data['page_title'] = 'Transaction History';
            $this->load->view('commons/header', $meta);
            $this->load->view('viewlist_customer_transaction_history', $data);
            $this->load->view('commons/footer');
        } else { //display the create customer form
            //set the flash data error message if there is one
            $data['message'] = (validation_errors() ? validation_errors() : $this->session->flashdata('message'));

            $data['customer_id'] = array('name' => 'customer_id',
                'id' => 'customer_id',
                'type' => 'text',
                'value' => $this->form_validation->set_value('customer_id'),
            );
            $data['start_date'] = array('name' => 'start_date',
                'id' => 'start_date',
                'type' => 'text',
                'value' => $this->form_validation->set_value('start_date'),
            );

            $data['end_date'] = array('name' => 'end_date',
                'id' => 'end_date',
                'type' => 'text',
                'value' => $this->form_validation->set_value('end_date'),
            );

            $meta['page_title'] = 'Customer Balance ';
            $data['page_title'] = 'View Customer Balance';

            //redirect('module=discount&view=customer_transaction_history',$meta, $data);

            $this->load->view('commons/header', $meta);
            //$this->load->view('customer_transaction_history', $data);
            $this->load->view('viewlist_customer_transaction_history', $data);
            $this->load->view('commons/footer');
        }
    }

    function view_invoice_details()
    {

        $sale_id = $_GET['sale_id'];
        $data['rows'] = $this->discount_model->getAllInvoiceItemsWithDetails($sale_id);

        //print_r($data['rows']); exit;   

        $inv = $this->discount_model->getInvoiceBySaleID($sale_id);
        $biller_id = $inv->biller_id;
        $customer_id = $inv->customer_id;

        //$data['cusBalance'] = $this->discount_model->getCustomerBalancebyID($customer_id);     
        $invoice_type_id = $inv->invoice_type;

        $cusBalance = $this->discount_model->getCustomerBalancebyID($customer_id);
        $data['cusLatestAmount'] = $cusBalance->total_balance_amount;

        $cusLatestBalance = $this->discount_model->getCustomerLatestBalancebyID($customer_id);
        $data['latestBalanceAmount'] = $cusLatestBalance->total_balance;

        $cusPreBalance = $this->discount_model->getCustomerPreBalancebyID($sale_id, $customer_id);
        $data['cusPreBalance'] = $cusPreBalance->pre_balance;


        $data['biller'] = $this->discount_model->getBillerByID($biller_id);
        $data['customer'] = $this->discount_model->getCustomerByID($customer_id);
        $data['invoice_types_details'] = $this->discount_model->getInvoiceTypeByID($invoice_type_id);

        $dataforTransaction = $this->discount_model->getPaymentForInvoice($sale_id);
        $data['latestPaymentmount'] = $dataforTransaction->latest_payment;

        $data['inv'] = $inv;

        $data['page_title'] = $this->lang->line("invoice");
        $this->load->view('view_invoice', $data);
    }

    function view_invoice_details1()
    {

        $sale_id = $_GET['sale_id'];

        $data['message'] = (validation_errors() ? validation_errors() : $this->session->flashdata('message'));
        $data['rows'] = $this->discount_model->getAllInvoiceItemsWithDetails($sale_id);

        $inv = $this->discount_model->getInvoiceBySaleID($sale_id);
        $biller_id = $inv->biller_id;
        $customer_id = $inv->customer_id;

        $cusBalance = $this->discount_model->getCustomerBalancebyID($customer_id);
        $data['cusLatestAmount'] = $cusBalance->total_balance_amount;
        print_r($data['cusBalance']);
        exit;

        //$cusPreBalance= $this->discount_model->getCustomerPreBalancebyID($customer_id);
        //$data['cusPreAmount']=$cusPreBalance->total_balance;

        $invoice_type_id = $inv->discount_model;
        $data['biller'] = $this->discount_model->getBillerByID($biller_id);
        $data['customer'] = $this->discount_model->getCustomerByID($customer_id);
        $data['invoice_types_details'] = $this->discount_model->getInvoiceTypeByID($invoice_type_id);

        $data['inv'] = $inv;

        $data['page_title'] = $this->lang->line("invoice");
        $this->load->view('view_invoice', $data);
    }

    function customer_details()
    {

        $customer_id = $_GET['customer_id'];
        $data['customerData'] = $this->discount_model->getCustomerByID($customer_id);
        //print_r($data['customerDetails']); exit; 

        $meta['page_title'] = 'Customer Details';
        $data['page_title'] = 'Customer Details';
        $this->load->view('commons/header', $meta);
        $this->load->view('customer_details', $data);
        $this->load->view('commons/footer');
    }

}
