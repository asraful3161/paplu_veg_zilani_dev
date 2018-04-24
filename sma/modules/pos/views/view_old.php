<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title><?php echo $page_title . " " . $this->lang->line("no") . " " . $inv->id; ?></title>
        <link rel="shortcut icon" href="<?php echo $this->config->base_url(); ?>assets/img/favicon.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="<?php echo $this->config->base_url(); ?>assets/css/<?php echo THEME; ?>.css" rel="stylesheet">
        <script type="text/javascript" src="<?php echo $this->config->base_url(); ?>assets/js/jquery.js"></script>


        <script type="text/javascript">
            function printDiv(divName) {
                var printContents = document.getElementById(divName).innerHTML;
                var originalContents = document.body.innerHTML;
                document.body.innerHTML = printContents;
                window.print();
                document.body.innerHTML = originalContents;
            }
        </script>   

    </head>

    <body>

        <div style="margin:0px auto; width: 900px;">
        <div class="prinbtn" align="center" style="padding-top: 0px;">   
            <input type="button" onclick="printDiv('printableArea')" value="Print Invoice" />  
        </div>   
        <div id="printableArea">       


<!--<img src="<?php echo $this->config->base_url(); ?>assets/img/<?php echo $inv->status; ?>.png" alt="<?php echo $inv->status; ?>" style="float: right; position: absolute; top:0; right: 0;"/>-->
            <div id="wrap">
                <div class="row-fluid"> 
                    <div class="span12"> 
                        <table class="tableHead table-responsive">
                            <tr>
                                <td width="30%">
                                    <h5><?php echo $biller->company; ?></h5>
                                    <?php
                                    echo $biller->address . ",<br />" . $biller->city . ", " . $biller->postal_code . ", " . $biller->state . ",<br />" . $biller->country;
                                    echo "
	<br /><br />" . $this->lang->line("tel") . ": " . $biller->phone . "<br />" . $this->lang->line("email") . ": " . $biller->email;
                                    echo "<p>";
                                    echo "</p>";
                                    ?>
                                </td>
                                <td width="20%">
                                    <h5 class="inv"><?php echo $this->lang->line("invoice") . " " . $this->lang->line("no") . " " . $inv->id; ?></h5>
                                    <?php echo $this->lang->line("reference_no"); ?>: <?php echo $inv->reference_no; ?></br>
                                    <?php echo $this->lang->line("date"); ?>: <?php echo date(PHP_DATE, strtotime($inv->date)); ?></br> 
                                </td>  
                                <td width="50%"> 
                                   
                                    <h5>
                                         <?php echo $this->lang->line("billed_to"); ?>:
                                        <?php
                                        if ($customer->company != "-") {
                                            echo $customer->company;
                                        } else {
                                            echo $customer->name;
                                        }
                                        ?></h5>
                                    <?php
                                    if ($customer->company != "-") {
                                        echo "<p>Attn: " . $customer->name . "</p>";
                                    }
                                    ?>
                                    <p>
<?php
if ($customer->address != "-") {
    echo $this->lang->line("address") . ": " . $customer->address . ", " . $customer->city . ", " . $customer->postal_code . ", " . $customer->state . ", " . $customer->country;
}
?>
                                        <br> <?php echo $this->lang->line("tel") . ": " . $customer->phone; ?>
                                        <br><?php echo $this->lang->line("email") . ": " . $customer->email; ?>
                                </td>
                            </tr>
                        </table> 
                    </div>
                </div>
                <div style="clear: both;"></div>
                <div class="row-fluid"> 
                    <div style="clear: both;"></div>	
                </div>
               
<style>

           .tableItem{
                 width: auto;
                 color:black;
           }
           .tableItem tr{
                height:10px; 
            }
           .tableItem tr:nth-child(even) {
                background-color: #D8D8D8;
                color:black;
            }
            .tableHead  td {
                padding: 10px;
                line-height: 14px;
                text-align: left;
                vertical-align: top;
                border-top: 0px solid #dddddd;
            }

</style>  

                <table frame="box"  class="tableItem  table-hover table-striped" style="margin-bottom: 0px;">

	            <thead style="border-top:1px solid black; border-bottom:1px solid black;"> 

                        <tr> 

                            <th style="width:100px; text-align:center; vertical-align:middle;"><?php echo $this->lang->line("quantity"); ?></th>  
                            <th style="vertical-align:center; text-align:center;"><?php echo $this->lang->line("description"); ?></th> 

                            <!--<?php
                                        if (TAX1) {
                                            echo '<th style="text-align:center; vertical-align:middle;">' . $this->lang->line("tax") . '</th>';
                                        }
                                        ?>-->

                            <!--<th style="text-align:center; vertical-align:middle;"></th>-->
                            <th style="padding-right:2px; text-align:center; vertical-align:middle;">Weight (Kg)</th> 
                            <th style="padding-right:20px; text-align:center; vertical-align:middle;"><?php echo $this->lang->line("unit_price"); ?></th> 
                            <th style="width:130px; text-align:center; vertical-align:middle;">Price Per KG</th>
<?php //if(DISCOUNT_OPTION == 2) { echo '<th style="text-align:center; vertical-align:middle;">'.$this->lang->line("discount").'</th>'; }   ?>
<?php
if (TAX1) {
    echo '<th style="width: 110px; padding-right:20px; text-align:center; vertical-align:middle;">' . 'VAT' . '</th>';
}
?>
                            <th style="padding-right:20px; text-align:right; vertical-align:right;"><?php echo $this->lang->line("subtotal"); ?></th> 
                        </tr> 

                    </thead> 

                    <tbody> 

<?php
//print_r(json_encode($rows1)); 
//print_r($rows1); 

$r = 1;
foreach ($rows1 as $row):
    ?>


                            <tr>
                                <td style="text-align:center; width:40px; vertical-align:middle;"><?php echo $row->quantity; ?></td>
                                <td style="vertical-align:middle; text-align:center;"><?php echo $row->product_name; ?>
    <?php
    if ($row->details) {
        echo '<div>' . html_entity_decode($row->details) . '</div>';
    }
    ?></td>


                                <!--<?php
    if (TAX1) {
        echo '<td style="width: 110px; text-align:center; vertical-align:middle;">' . $row->tax . '</td>';
    }
    ?>-->

                                <td style="width: 130px; text-align:center; padding-right:10px; vertical-align:middle;"><?php echo $row->product_weight; ?></td>
                                <td style="width: 130px; text-align:center;; padding-right:10px; vertical-align:middle;"><?php echo $this->ion_auth->formatMoney($row->unit_price); ?></td>


                                    <!--<td style="text-align:center; vertical-align:middle;"><?php //echo $row->price / $row->weight;  ?></td>-->
                                <td style="width: 130px; text-align:center; vertical-align:middle;"><?php echo $row->unit_price / $row->product_weight; ?></td>
                            <?php //if(DISCOUNT_OPTION == 2) { echo '<td style="width: 80px; text-align:center; vertical-align:middle;">'."test".'</td>'; }  ?>



                            <?php
                            if (TAX1) {
                                echo '<td style="width: 80px; text-align:center; vertical-align:middle;"><!--<small>(' . $row->tax . ')</small>--> ' . $this->ion_auth->formatMoney($row->val_tax) . '</td>';
                            }
                            ?>

                                <td style="width: 130px; text-align:right; padding-right:10px; vertical-align:middle;">
                            <?php // echo $subTotal = $this->ion_auth->formatMoney(($row->price * $row->orderedquantity) - ($row->customer_discount * $row->orderedquantity)); ?>
                            <?php echo $subTotal = $this->ion_auth->formatMoney($row->gross_total); ?>
                                </td>  
                            </tr> 
                            <?php
                            $r++;
                        endforeach;
                        ?>
                        <?php
                        $col = 3;
                        if (PRODUCT_SERIAL) {
                            $col += 1;
                        } if (DISCOUNT_OPTION == 2) {
                            $col += 1;
                        } if (TAX1) {
                            $col += 1;
                        }
                        ?>

<?php
if (TAX1 || TAX2 || DISCOUNT_OPTION == 1 || DISCOUNT_OPTION == 2) {
    echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . 'Total Invoice Value' . ' (' . CURRENCY_PREFIX . ')</td><td style="text-align:right; padding-right:10px;">' . $this->ion_auth->formatMoney($inv->total) . '</td></tr>';
}
?>
<?php
if (TAX2) {
    echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . VAT . ' (' . CURRENCY_PREFIX . ')</td><td style="text-align:right; padding-right:10px;">' . $this->ion_auth->formatMoney($inv->total_tax2) . '</td></tr>';
}
?>

<?php
$netTotal = $inv->total + $inv->total_tax2;
?>  
                    <b><?php
if (TAX2) {
    echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . '<b>Total Amount</b>' . ' (<b>' . CURRENCY_PREFIX . '</b>)</td><td style="text-align:right; padding-right:10px;"><b>' . $this->ion_auth->formatMoney($netTotal) . '</b></td></tr>';
}
?> 

                        </tbody> 
                </table> 

                <div style="clear: both;"></div>
                <div class="order_note">
                    <table>
                        <tr>
                            <td style="font-size:14px;">Order Note:</td> 
                            <td style="font-size:12px;"><?php echo $inv->order_note; ?></td>
                        </tr>  
                    </table> 
                </div>
                <div class="row-fluid">
                    <div class="span9">  
                        <div class="span12">  
                            <div data-example-id="simple-pre">
                                <p style="margin:0px; padding:0px;">Terms & Condition :</p>  
                                <pre> *Please Report Any Damage Goods on Delivery To the Driver.<br> *Goods Remain Property of (Paplu Fresh Vegetables) until Full Payment Has Been Received. <br> *Any cheque Dishonoured will Have a Charge of &pound;35.00 </pre>
                            </div> 
                        </div>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span5">  
                        <p>Goods Received By :  <?php //echo $inv->user;  ?> </p> 
                        <p style="border-bottom: 1px solid #666;">&nbsp;</p>
                        <p><?php echo $this->lang->line("signature") . " &amp; " . $this->lang->line("stamp"); ?></p>
                    </div>
                </div>
            </div>
        </div> 
            
      </div>   
    </body>
</html>