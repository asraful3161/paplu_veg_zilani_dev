<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');


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

class Sales_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function getAllBillers() {
        $q = $this->db->get('billers');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function getProductsByCode($code) {
        $this->db->select('*')->from('products')->like('code', $code, 'both');
        $q = $this->db->get();
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function getNextAI() {
        $this->db->select_max('id');
        $q = $this->db->get('sales');
        if ($q->num_rows() > 0) {
            $row = $q->row();
            //return SALES_REF."-".date('Y')."-".sprintf("%03s", $row->id+1);
            return SALES_REF . "-" . sprintf("%04s", $row->id + 1);
        }

        return FALSE;
    }

    public function getBillerByID($id) {

        $q = $this->db->get_where('billers', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

    public function getProductByCode($code) {

        $q = $this->db->get_where('products', array('code' => $code), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function getAllCustomers() {
        $q = $this->db->get('customers');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function getCustomerByID($id) {

        $q = $this->db->get_where('customers', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function getAllProducts() {
        $this->db->select('*')->from('products')->order_by('id', 'asc');
        $q = $this->db->get();
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function getProductByID($id) {

        $q = $this->db->get_where('products', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function getAllTaxRates() {
        $q = $this->db->get('tax_rates');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function getTaxRateByID($id) {

        $q = $this->db->get_where('tax_rates', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function getAllDiscounts() {
        $q = $this->db->get('discounts');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function getDiscountByID($id) {

        $q = $this->db->get_where('discounts', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function getAllInvoiceTypes() {
        $q = $this->db->get('invoice_types');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function getAllInvoiceTypesFor() {
        $q = $this->db->get_where('invoice_types', array('type' => 'real'));
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function getInvoiceTypeByID($id) {

        $q = $this->db->get_where('invoice_types', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function updateProductQuantity($product_id, $warehouse_id, $quantity) {

        // update the product with new details
        if ($this->addQuantity($product_id, $warehouse_id, $quantity)) {
            return true;
        }

        return false;
    }

    public function calculateAndUpdateQuantity($item_id, $product_id, $quantity, $warehouse_id) {
        //check if entry exist then update else inster
        if ($this->getProductQuantity($product_id, $warehouse_id)) {

            //get product details to calculate quantity
            $warehouse_quantity = $this->getProductQuantity($product_id, $warehouse_id);
            $warehouse_quantity = $warehouse_quantity['quantity'];
            $item_details = $this->getItemByID($item_id);
            $item_quantity = $item_details->quantity;
            $after_quantity = $warehouse_quantity + $item_quantity;
            $new_quantity = $after_quantity - $quantity;

            if ($this->updateQuantity($product_id, $warehouse_id, $new_quantity)) {
                return TRUE;
            }
        } else {

            if ($this->insertQuantity($product_id, $warehouse_id, -$quantity)) {
                return TRUE;
            }
        }

        return FALSE;
    }

    public function CalculateOldQuantity($item_id, $product_id, $quantity, $warehouse_id) {


        //get product details to calculate quantity
        $warehouse_quantity = $this->getProductQuantity($product_id, $warehouse_id);
        $warehouse_quantity = $warehouse_quantity['quantity'];
        $item_details = $this->getItemByID($item_id);
        $item_quantity = $item_details->quantity;
        $after_quantity = $warehouse_quantity + $item_quantity;


        if ($this->updateQuantity($product_id, $warehouse_id, $after_quantity)) {
            return TRUE;
        }



        return FALSE;
    }

    public function addQuantity($product_id, $warehouse_id, $quantity) {

        if ($this->getProductQuantity($product_id, $warehouse_id)) {

            $warehouse_quantity = $this->getProductQuantity($product_id, $warehouse_id);
            $old_quantity = $warehouse_quantity['quantity'];
            $new_quantity = $old_quantity - $quantity;

            if ($this->updateQuantity($product_id, $warehouse_id, $new_quantity)) {
                return TRUE;
            }
        } else {

            if ($this->insertQuantity($product_id, $warehouse_id, -$quantity)) {
                return TRUE;
            }
        }

        return FALSE;
    }

    public function insertQuantity($product_id, $warehouse_id, $quantity) {

        // Product data
        $productData = array(
            'product_id' => $product_id,
            'warehouse_id' => $warehouse_id,
            'quantity' => $quantity
        );

        if ($this->db->insert('warehouses_products', $productData)) {
            return true;
        } else {
            return false;
        }
    }

    public function updateQuantity($product_id, $warehouse_id, $quantity) {

        $productData = array(
            'quantity' => $quantity
        );

        //$this->db->where('product_id', $id);		
        if ($this->db->update('warehouses_products', $productData, array('product_id' => $product_id, 'warehouse_id' => $warehouse_id))) {
            return true;
        } else {
            return false;
        }
    }

    public function getProductQuantity($product_id, $warehouse) {
        $q = $this->db->get_where('warehouses_products', array('product_id' => $product_id, 'warehouse_id' => $warehouse), 1);

        if ($q->num_rows() > 0) {
            return $q->row_array(); //$q->row();
        }

        return FALSE;
    }

    /* public function updateProduct($id, $quantity)
      {

      // Product data
      $productData = array(
      'quantity'	     	=> $quantity,
      );

      $this->db->where('id', $id);
      if($this->db->update('products', $productData)) {
      return true;
      }

      return false;

      } */

    public function getItemByID($id) {

        $q = $this->db->get_where('sale_items', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function getAllSales() {
        $q = $this->db->get('sales');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function getmonthlyPurchases() {
        $myQuery = "SELECT date_format( date, '%b' ) as month, SUM( total ) as purchases FROM purchases WHERE date >= date_sub( now( ) , INTERVAL 12 MONTH ) GROUP BY date_format( date, '%b' ) ORDER BY date_format( date, '%m' ) ASC";
        $q = $this->db->query($myQuery);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function getmonthlySales() {
        $myQuery = "SELECT date_format( date, '%b' ) as month, SUM( total ) as sales FROM sales WHERE in_type = 'real' AND date >= date_sub( now( ) , INTERVAL 12 MONTH ) GROUP BY date_format( date, '%b' ) ORDER BY date_format( date, '%m' ) ASC";
        $q = $this->db->query($myQuery);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function getCustomerProductWeight($productid) {
        $this->db->select("weight");
        $this->db->from('products');
        $this->db->where('id', $productid);
        $this->db->limit(1);
        $q = $this->db->get();

        if ($q->num_rows() > 0) {
            foreach ($q->result() as $row) {
                $discount = $row->weight;
            }
        } else {
            $discount = 0;
        }
        //echo $discount;
        return $discount;
    }
    public function getCustomerProductType($productid) {
        $this->db->select("cf1");
        $this->db->from('products');
        $this->db->where('id', $productid);
        $this->db->limit(1);
        $q = $this->db->get();

        if ($q->num_rows() > 0) {
            foreach ($q->result() as $row) {
                $prtp = $row->cf1;
                if ($prtp == "") {
                    $prtp = "Fixed";
                }
            }
        } else {
            $prtp = "Fixed";
        }
        //echo $discount;
        return $prtp;
    }
    public function getAllInvoiceItems($sale_id) {
        $this->db->order_by('id', 'asc');
        $q = $this->db->get_where('sale_items', array('sale_id' => $sale_id));
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $productid = $row->product_id;
                $prweight = $this->getCustomerProductWeight($productid);
                $prtype = $this->getCustomerProductType($productid);
                $row->product_weight = $prweight;
                $row->product_type = $prtype;

                $data[] = $row;
            }

            return $data;
        }
    }

    public function getAllInvoiceItemsWithDetails($sale_id) {
        $this->db->select('sale_items.id, sale_items.variprod_note, sale_items.sale_product_weight, sale_items.product_name, sale_items.product_code, sale_items.quantity, sale_items.serial_no, sale_items.tax, sale_items.unit_price, sale_items.val_tax, sale_items.discount_val, sale_items.gross_total, products.details, products.weight');
        $this->db->join('products', 'products.id=sale_items.product_id', 'left');
        $this->db->order_by('id', 'asc');
        $q = $this->db->get_where('sale_items', array('sale_id' => $sale_id));
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function getInvoiceByID($id) {

        $q = $this->db->get_where('sales', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function getInvoiceBySaleID($sale_id) {

        $q = $this->db->get_where('sales', array('id' => $sale_id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function getQuoteByID($id) {

        $q = $this->db->get_where('quotes', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function getQuoteByQID($id) {
        $this->db->select("reference_no, warehouse_id, biller_id, biller_name, customer_id, customer_name, date, note, inv_total, total_tax, total");
        $this->db->from('quotes');
        $this->db->where('id', $id);
        $this->db->limit(1);
        $q = $this->db->get();
        if ($q->num_rows() > 0) {
            return $q->row_array();
        }

        return FALSE;
    }

    public function getAllQuoteItems($quote_id) {
        $q = $this->db->get_where('quote_items', array('quote_id' => $quote_id));
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function nsQTY($product_id, $quantity) {
        $prD = $this->getProductByID($product_id);
        $nQTY = $prD->quantity - $quantity;
        $this->db->update('products', array('quantity' => $nQTY), array('id' => $product_id));
    }

    public function addSale($saleDetails = array(), $items = array(), $warehouse_id) {

        
        $invoice_bill=$saleDetails['total'];
        $customer_id=$saleDetails['customer_id'];
        
        // sale data
        $saleData = array(
            'reference_no' => $saleDetails['reference_no'],
            'warehouse_id' => $warehouse_id,
            'biller_id' => $saleDetails['biller_id'],
            'biller_name' => $saleDetails['biller_name'],
            'customer_id' => $saleDetails['customer_id'],
            'customer_name' => $saleDetails['customer_name'],
            'date' => $saleDetails['date'],
            'note' => $saleDetails['note'],
            'internal_note' => $saleDetails['internal_note'],
            'inv_total' => $saleDetails['inv_total'],
            'total_tax' => $saleDetails['total_tax'],
            'total' => $saleDetails['total'],
            'total_tax2' => $saleDetails['total_tax2'],
            'tax_rate2_id' => $saleDetails['tax_rate2_id'],
            'inv_discount' => $saleDetails['inv_discount'],
            'discount_id' => $saleDetails['discount_id'],
            'user' => $saleDetails['user'],
            'shipping' => $saleDetails['shipping']
        );

        if ($this->db->insert('sales', $saleData)) {
            $sale_id = $this->db->insert_id();

            foreach ($items as $idata) {
                $this->nsQTY($idata['product_id'], $idata['quantity']);
                $this->updateProductQuantity($idata['product_id'], $warehouse_id, $idata['quantity']);
            }

            $addOn = array('sale_id' => $sale_id);
            end($addOn);
            foreach ($items as &$var) {
                $var = array_merge($addOn, $var);
            }

            if ($this->db->insert_batch('sale_items', $items)) {
                return true;
            }
        }

        return false;
    }

    public function usQTY($product_id, $quantity) {
        $prD = $this->getProductByID($product_id);
        $nQTY = $prD->quantity + $quantity;
        $this->db->update('products', array('quantity' => $nQTY), array('id' => $product_id));
    }

    public function updateSale($id, $saleDetails, $items = array(), $warehouse_id) {

        if ($old_items = $this->getAllInvoiceItems($id)) {
            foreach ($old_items as $data) {
                $item_id = $data->id;
                $item_qiantity = $data->quantity;
                $product_id = $data->product_id;
                $pr_qty_details = $this->getProductQuantity($product_id, $warehouse_id);
                $pr_qty = $pr_qty_details['quantity'];
                $qty = $pr_qty + $item_qiantity;

                $this->updateQuantity($product_id, $warehouse_id, $qty);
                $this->usQTY($product_id, $item_qiantity);
            }
        }

        // sale data
        $saleData = array(
            'reference_no' => $saleDetails['reference_no'],
            'biller_id' => $saleDetails['biller_id'],
            'biller_name' => $saleDetails['biller_name'],
            'customer_id' => $saleDetails['customer_id'],
            'customer_name' => $saleDetails['customer_name'],
            'date' => $saleDetails['date'],
            'note' => $saleDetails['note'],
            'internal_note' => $saleDetails['internal_note'],
            'inv_total' => $saleDetails['inv_total'],
            'total_tax' => $saleDetails['total_tax'],
            'total' => $saleDetails['total'],
            'total_tax2' => $saleDetails['total_tax2'],
            'tax_rate2_id' => $saleDetails['tax_rate2_id'],
            'inv_discount' => $saleDetails['inv_discount'],
            'discount_id' => $saleDetails['discount_id'],
            'updated_by' => $saleDetails['user'],
            'shipping' => $saleDetails['shipping']
        );

        $this->db->where('id', $id);
        if ($this->db->update('sales', $saleData) && $this->db->delete('sale_items', array('sale_id' => $id))) {
            foreach ($items as $idata) {
                $this->nsQTY($idata['product_id'], $idata['quantity']);
                $this->updateProductQuantity($idata['product_id'], $warehouse_id, $idata['quantity']);
            }

            $addOn = array('sale_id' => $id);
            end($addOn);
            foreach ($items as &$var) {
                $var = array_merge($addOn, $var);
            }

            if ($this->db->insert_batch('sale_items', $items)) {
                return true;
            }
        }

        return false;
    }

    public function getAllWarehouses() {
        $q = $this->db->get('warehouses');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function deleteInvoice($id) {
        $inv = $this->getInvoiceByID($id);
        $warehouse_id = $inv->warehouse_id;
        $items = $this->getAllInvoiceItems($id);

        foreach ($items as $item) {
            $product_id = $item->product_id;

            $item_details = $this->getProductQuantity($product_id, $warehouse_id);
            $pr_quantity = $item_details['quantity'];
            $inv_quantity = $item->quantity;
            $new_quantity = $pr_quantity + $inv_quantity;

            $this->updateQuantity($product_id, $warehouse_id, $new_quantity);
            $this->usQTY($product_id, $item->quantity);
        }

        if ($this->db->delete('sale_items', array('sale_id' => $id)) && $this->db->delete('sales', array('id' => $id))) {
            return true;
        }
        return FALSE;
    }

    public function deleteQuote($id) {

        if ($this->db->delete('quote_items', array('quote_id' => $id)) && $this->db->delete('quotes', array('id' => $id))) {
            return true;
        }

        return FALSE;
    }

    public function getProductNames($term) {
        $this->db->select('name')->limit('10');
        $this->db->like('name', $term, 'both');
        $q = $this->db->get('products');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function getProductByName($name) {

        $q = $this->db->get_where('products', array('name' => $name), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function addDelivery($data = array()) {
        if ($this->db->insert('deliveries', $data)) {
            return true;
        }

        return false;
    }

    public function updateDelivery($id, $data = array()) {
        $this->db->where('id', $id);
        if ($this->db->update('deliveries', $data)) {
            return true;
        }

        return false;
    }

    public function getDeliveryByID($id) {

        $q = $this->db->get_where('deliveries', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function deleteDelivery($id) {

        if ($this->db->delete('deliveries', array('id' => $id))) {
            return true;
        }

        return FALSE;
    }

    public function getWarehouseProductQuantity($warehouse_id, $product_id) {

        $q = $this->db->get_where('warehouses_products', array('warehouse_id' => $warehouse_id, 'product_id' => $product_id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function getProductCodes($term) {
        $this->db->select('code');
        $this->db->like('code', $term, 'both')->limit('10');
        $q = $this->db->get('products');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function getCustomerBalancebyID($custid) {

        //$myQuery = "Select DISTINCT(customer_balance), date from customer_balance where customer_id= $custid ORDER BY date DESC LIMIT 1 ";

        $myQuery = "Select * from customer_balance where customer_id= $custid  LIMIT 1 ";
        
        $q = $this->db->query($myQuery, false);
        if ($q->num_rows() > 0) {
            return $q->row();
        } else {
            return 0;
        }
    }
    
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
        
        //echo $sale_id;
       // echo $custid;

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
    
    public function updateTranHistory($id, $saleDetails) {
//        echo $id;
        //print_r($saleDetails);
//        exit;
        //echo '</br></br>'.$id; 
        //print_r($saleDetails); exit; 
        
        $customer_id=$saleDetails['customer_id'];
        $total_tax=$saleDetails['total_tax'];
        $saleID = $id;
        //$newinv_total = $saleDetails['inv_total'];
        $cusLatestBill = $this->getCustomerLatestBill($customer_id);
        //print_r($cusLatestBill);  
        $cus_latest_bill=$cusLatestBill->total_balance; 
        $transaction_history_id=$cusLatestBill->transaction_history_id; 
           
        $InvoiceInfo  = $this->getInvoiceInfo($saleID);
        
        //print_r($InvoiceInfo);exit; 
        //exit;
        $latest_bill=$saleDetails['inv_total'] + $total_tax; 
        $previous_bill_amount = $InvoiceInfo->bill_amount; 
        
        $finalBalance= $cus_latest_bill + ($latest_bill - $previous_bill_amount);    
        
        
        //echo $transaction_history_id; exit;   
        //$total_balanceOfInvoice = $InvoiceInfo->total_balance;
        
        //echo $latest_bill; exit;  
        
        $updatedate = date("Y-m-d"); 
        
        $upadateData = array(
                            'bill_amount'	=> $latest_bill,   
                            'update_date'	=> $updatedate,  
                            );
        $result=$this->db->update('transaction_history', $upadateData, array('sale_id' => $saleID));
        
          if($result){ 
            $upadateDataForBalance = array(
                            'total_balance'	=> $finalBalance,    
                            'update_date'	=> $updatedate,  
                            );
                   $this->db->update('transaction_history', $upadateDataForBalance, array('transaction_history_id' => $transaction_history_id));  
            
            $upadateofCusBalance = array(
                            'total_balance_amount'	=> $finalBalance  
                            );
                   $this->db->update('customer_balance', $upadateofCusBalance, array('customer_id' => $customer_id)); 
            
            }

    }
    
    
    
    
    public function getCustomerLatestBill($custid) {     
         
     $myQuery = "Select * from transaction_history where customer_id= $custid ORDER BY transaction_history_id DESC LIMIT 1 ";
       
        $q = $this->db->query($myQuery, false);
            if( $q->num_rows() > 0 ){
                return $q->row();
            } else {
                return FALSE;
            }
    }
    
    public function getInvoiceInfo($saleID) {     
         
     $myQuery = "Select * from transaction_history where sale_id= $saleID  LIMIT 1 ";
       
        $q = $this->db->query($myQuery, false);
        if( $q->num_rows() > 0 ){
            return $q->row();
        } else {
            return 0;
        }
    }
    
    /////////////////////27-04-2015////////////////////////
    
    
    	function getSetting() 
	{
		
		$q = $this->db->get('pos_settings'); 
		  if( $q->num_rows() > 0 )
		  {
			return $q->row();
		  } 
		
		  return FALSE;
	}
        
        public function getInvoiceBySaleID_old($sale_id) {

            $q = $this->db->get_where('sales', array('id' => $sale_id), 1); 
              if( $q->num_rows() > 0 )
              {
             return $q->row();
              } 

              return FALSE;
        }
        
        public function getAllInvoiceItems_old($sale_id) 
        {
         $q = $this->db->get_where('sale_items', array('sale_id' => $sale_id)); 
            if($q->num_rows() > 0) {
             foreach (($q->result()) as $row) {
                   $productid = $row->product_id;
                   $prweight = $this->getCustomerProductWeight($productid);
                   $row->product_weight = $prweight;
                //$data[] = $row; 
                    $data[] = $row;
             }

             return $data;
            }
        }
        
        
       /* 
    public function getCustomerLatestPaymentID($custid) {

        $myQuery = "SELECT payment,transaction_history_id
                    FROM transaction_history
                    WHERE customer_id= $custid
                    AND action_type = 'Payment In'
                    ORDER BY transaction_history_id DESC 
                    LIMIT 0, 1";
        
        $q = $this->db->query($myQuery, false);
        if ($q->num_rows() > 0) {
            return $q->row();
        } else {
            return 0;
        }
    }  
    
  public function getCustomerLatestSaleID($custid) {

      //echo $custid; exit; 
        $myQuery = "SELECT sale_id
                    FROM transaction_history
                    WHERE customer_id = $custid
                    AND sale_id!=''    
                    ORDER BY transaction_history_id DESC 
                    LIMIT 0, 1";
        
        $q = $this->db->query($myQuery, false);
        if ($q->num_rows() > 0) {
            return $q->row();
        } else {
            return 0;
        }
    }
    
    
    public function getTransIdofInvoice($sale_id) {

        $myQuery = "SELECT payment,transaction_history_id
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
    */
    
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
    


}
