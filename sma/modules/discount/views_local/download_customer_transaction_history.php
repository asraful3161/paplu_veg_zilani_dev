
<!--
<style type="text/css">
  .TFtable{
    width:100%; 
    border-collapse:collapse; 
  }
  .TFtable td{ 
    padding:7px; border:#4e95f4 1px solid;
  }
  /* provide some minimal visual accomodation for IE8 and below */
  .TFtable tr{
    background: #b8d1f3;
  }
  /*  Define the background color for all the ODD background rows  */
  .TFtable tr:nth-child(odd){ 
    background: #b8d1f3;
  }
  /*  Define the background color for all the EVEN background rows  */
  .TFtable tr:nth-child(even){
    background: #dae5f4;
  }
</style>

-->

<?php
//print_r($price_details);

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//http://www.php-guru.in/2013/html-to-pdf-conversion-in-codeigniter/
tcpdf();
$obj_pdf = new TCPDF('L', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
$obj_pdf->SetCreator(PDF_CREATOR);
$title = "PDF Report";
$obj_pdf->SetTitle($title);
$obj_pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, $title, PDF_HEADER_STRING);
$obj_pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$obj_pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
$obj_pdf->SetDefaultMonospacedFont('helvetica');
$obj_pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$obj_pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
$obj_pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$obj_pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
$obj_pdf->SetFont('helvetica', '', 9);
$obj_pdf->setFontSubsetting(false);
$obj_pdf->writeHTML(utf8_encode($html), true, 0, true, 0);
$obj_pdf->AddPage();

?>

<table class="TFtable">
      <thead>
          <tr>
                        <th style="width:35px;">SL</th>
                        <th>Customer Name</th>
                        <th>Date</th>   
                        <th>Invoice Number</th>
                        <th>Bill Amount</th> 
                        <th>Payment</th>
                        <th>Less</th>  
                        <th>Charges</th>
                        <th>Note</th>
                        <th>Payment Method</th>
                        <th>Previous Balance</th>
                        <th>Current Balance</th>
                        
          </tr>
      </thead>
      <tbody>
            <?php 
            $r = 1;
            foreach ($customer_transavtion_history as $row):?>     
              <tr>
                        <td><?php echo $r; ?></td>
                        <td><?php echo $row->name; ?></td>
                        <td><?php echo $row->date; ?></td>
                        <td><?php echo $row->sale_id; ?></td>
                        <td><?php echo $row->bill_amount; ?></td>
                        <td><?php echo $row->payment; ?></td>
                        <td><?php echo $row->less; ?></td>
                        <td><?php echo $row->charge; ?></td>
                        <td><?php echo $row->note; ?></td>
                        <td><?php echo $row->action_type; ?></td>
                        <td><?php echo $row->pre_balance; ?></td> 
                        <td><?php echo $row->total_balance; ?></td>  
              </tr>
                    
            <?php $r++; endforeach;?>
      </tbody>
  </table>


<?php

$content = ob_get_contents();
ob_end_clean();
$obj_pdf->writeHTML($content, true, false, true, false, '');
$obj_pdf->Output('output.pdf', 'I');
        
        
