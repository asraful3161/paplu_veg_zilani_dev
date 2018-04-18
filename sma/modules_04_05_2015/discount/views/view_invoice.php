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

            $(document).ready(function () {
                $('#fixed_div').attr('disabled', true);
            });
        </script>   
        <style type="text/css"> 
            .tableItem{
                width: auto;
                color:black;
                font-size: 11px!important;
                line-height: 17px!important;
            }
            .tableItem tr{
                height:14px; 
            }
            .tableItem tr:nth-child(even) { 
                color:black;
            }

            .tableItem2{
                width: auto;
                color:black;
            }
            .tableItem2 tr{
                height:15px; 
            }
            .tableItem2 tr:nth-child(even) { 
                color:black;
            }
            .tableHead  td {
                padding: 10px;
                line-height: 16px;
                text-align: left;
                vertical-align: top;
                border-top: 0px solid #dddddd;
            }

        </style> 
    </head> 
    <body>
        <?php
        $cusNameCom = "";
        if ($customer->company != "-") {
            $cusNameCom = $customer->company;
            //$attain = "<p>Attn: " . $customer->name . "</p>";
            $address = $customer->address . ", </br>" . $customer->city . ", " . $customer->postal_code;
        } else {
            $cusNameCom = $customer->name;
            //$attain = "";
            $address = "";
        }
        $invHeader = "<tr><td colspan='7'><div class='span12'><table class='tableHead table-responsive'><tr>"
        . "<td width='50%'>" 
        . "<h5 class='inv'>" . $cusNameCom . "</h5>"
        . "$address"
        . "<br/>" . "Mobile" . ": " . $customer->mobile
        . "<br/>" . "Phone" . ": " . $customer->phone
        //. "<br/>" . $this->lang->line("email") . ": " . $customer->email
        . "</br><b>".$this->lang->line("invoice") . " " . $this->lang->line("no") . "</b> " . $inv->id
        . "</br>" . $this->lang->line("reference_no") . ": " . $inv->reference_no . ""
        . "<br/>" . $this->lang->line("date") . ": " . date(PHP_DATE, strtotime($inv->date))
        . "<br/>"
        . "<div style='height:72px;'></div>"
        . "</td>" 
        . "</tr></table></div></td></tr>";
//        $invHeader = "<tr><td colspan='7'><div class='span12'><table class='tableHead table-responsive'><tr>"
//                . "<td width='30%'>"
//                . "<h5>$biller->company</h5>"
//                . "" . $biller->address . ",<br/>" . $biller->city . ", " . $biller->postal_code . ", " . $biller->state . ",<br />" . $biller->country . ""
//                . "<br/>" . $this->lang->line("tel") . ": " . $biller->phone
//                . "<br/>" . 'Mobile' . ": " . $biller->mobile
//                . "<br/>" . $this->lang->line("email") . ": " . $biller->email
//                . "</td>"
//                . "<td width='20%'>"
//                . "<h5 class='inv'>" . $this->lang->line("invoice") . " " . $this->lang->line("no") . " " . $inv->id . "</h5>"
//                . "" . $this->lang->line("reference_no") . ":" . $inv->reference_no . ""
//                . "<br/>" . $this->lang->line("date") . ": " . date(PHP_DATE, strtotime($inv->date))
//                . "<br/>"
//                . "</td>"
//                . "<td width='50%'>"
//                . "<h5 class='inv'>" . $cusNameCom . "</h5>" . $attain
//                . "<p>$address"
//                . "<br/>" . "Mobile" . ": " . $customer->mobile
//                . "<br/>" . $this->lang->line("email") . ": " . $customer->email
//                . "</p></td>"
//                . "</tr></table></div></td></tr>";
        ?>
        <div style="margin:0px auto; width: 900px;">    
            <div class="prinbtn" align="center" style="padding-top: 10px;">   
                <input type="button" onclick="printDiv('printableArea')" value="Print Invoice" />  
            </div>    
            <?php
            $trnum = count($rows); 

            $newMasterarr = array_chunk($rows, 27, true); 
            $numOfPage = sizeof($newMasterarr);
            //$last_key = end(array_keys($newMasterarr));
            $m = 0; 
            ?>
            <div id="printableArea">       
                <div id="wrap">
                    <?php foreach ($newMasterarr as $rowsn) { 
                         $m++; 
                         ?>
                    <div class="row-fluid">  
                        <?php echo $invHeader; ?>
                        <?php //echo "";?>
                    </div>       
                    <div style="clear: both;"></div> 
                    <div class="row-fluid">  
                        <div style="clear: both;"></div>	
                    </div>  
                    <table frame="box" class="tableItem" style="margin-bottom: 0px; width:100%;">
                        <thead> 
                            <tr  style="border:1px solid #000; width:100%; "> 
                                <th style="text-align:center; vertical-align:middle; font-size: 14px;"><?php echo "QTY"; ?></th>  
                                <th style="vertical-align:left; text-align:left; font-size: 14px; padding-left: 10px;"><?php echo $this->lang->line("description"); ?></th>    
                                <th style="text-align:center; vertical-align:middle; font-size: 14px;">Weight (Kg)</th>
                                <th style="text-align:center; vertical-align:middle; font-size: 14px;"><?php echo $this->lang->line("unit_price"); ?></th> 
                                <?php
                                if (DISCOUNT_OPTION == 2) {
                                    echo '<th style="text-align:center; font-size: 14px; vertical-align:middle;">' . 'Price Per (KG)' . '</th>';
                                }
                                ?> 
                                <?php echo '<th style=" text-align:center; font-size: 14px; vertical-align:middle;">Total (KG)</th>'; ?>
                                <th style="padding-right:10px; text-align:right; font-size: 14px; vertical-align:middle;"><?php echo "Sub Total"; ?></th> 
                            </tr>  
                        </thead>  
                        <tbody>   
                            <?php  if ($rowsn === end($newMasterarr)){ 
                                    $finalrestofrows = 27 - sizeof($rowsn); 
                                    //echo $finalrestofrows = $restofrows-9; 
                                    foreach ($rowsn as $rownlast) { 
                                ?>
                                <tr style="height:18px; border:1px solid #eee; width:100%; "> 
                                    <td style="text-align:center; width:60px; vertical-align:middle; font-size: 15px; "><?php echo $rownlast->quantity; ?></td>
                                    <td style="width: 230px; vertical-align:middle; padding-left: 15px; text-align:left; font-size: 15px; "><?php echo $rownlast->product_name; ?></td>
                                    <td style="width: 120px; text-align:center; vertical-align:middle; font-size: 14px;"><?php echo  $this->ion_auth->formatMoney($rownlast->weight); ?></td>
                                    <td style="width: 100px; text-align:center;  padding-right:10px; font-size: 14px; vertical-align:middle;"><?php echo $this->ion_auth->formatMoney($rownlast->unit_price); ?></td>
                                    <td style="width: 120px; text-align:center; vertical-align:middle; font-size: 14px;"><?php echo $this->ion_auth->formatMoney($rownlast->unit_price / $rownlast->weight); ?></td>
                                    <td style="width: 125px; text-align:center; vertical-align:middle;">
                                        <div style="text-align:center; font-size: 14px;"><?php echo $rownlast->sale_product_weight;?></div>
                                        <div style="text-align:center; font-size: 14px;">
                                            <?php
                                            $str = $rownlast->variprod_note;
                                            $parts = explode("+", $str);
                                            $numOf = count($parts);
                                            for ($i = 0; $i < $numOf; $i++) {
                                                $j = $i + 1;
                                                if ($str != '') {
                                                    echo "$parts[$i]";
                                                    if ($i < $numOf - 1) {
                                                        echo " + ";
                                                    }
                                                    ?>
                                            <?php }
                                            }
                                            ?>
                                        </div>
                                    </td>
                                    <td style="width: 100px; text-align:right; padding-right:10px; vertical-align:middle; font-size: 14px;"><?php echo $this->ion_auth->formatMoney($rownlast->gross_total); ?></td>
                                </tr>
                                
                            <?php  } ?>
                                
                                    <?php if ($finalrestofrows > 0) {
                                    for ($k = 0; $k < $finalrestofrows; $k++) {
                                     ?>
                                    <?php echo '<tr style="height:18px; border:1px solid #eee; ">
                                                        <td colspan="7"></td> 
                                                </tr>';
                                    ?>
                                    <?php } } ?>
                            <?php     
                                } else {
                                foreach ($rowsn as $rown) { 
                            ?>
                                <tr style="height:18px; border:1px solid #eee; "> 
                                    <td style="text-align:center; width:60px; vertical-align:middle; font-size: 15px;"><?php echo $rown->quantity; ?></td>
                                    <td style="width: 230px; vertical-align:middle; padding-left: 15px; text-align:left; font-size: 15px;"><?php echo $rown->product_name; ?></td>
                                    <td style="width: 120px; text-align:center; vertical-align:middle; font-size: 14px;"><?php echo $rown->weight; ?></td>
                                    <td style="width: 100px; text-align:center;  padding-right:10px; font-size: 14px; vertical-align:middle;"><?php echo $this->ion_auth->formatMoney($rown->unit_price); ?></td>
                                    <td style="width: 120px; text-align:center; vertical-align:middle; font-size: 14px; "><?php echo $this->ion_auth->formatMoney($rown->unit_price / $rown->weight); ?></td>
                                    <td style="width: 125px; text-align:center; vertical-align:middle;">
                                        <div style="text-align:center; font-size: 14px;"><?php echo  $rown->sale_product_weight; ?></div>
                                        <div style="text-align:center; font-size: 14px;">
                                            <?php
                                            $str = $rown->variprod_note;
                                            $parts = explode("+", $str);
                                            $numOf = count($parts);
                                            for ($i = 0; $i < $numOf; $i++) {
                                                $j = $i + 1;
                                                if ($str != '') {
                                                    echo "$parts[$i]";
                                                    if ($i < $numOf - 1) {
                                                        echo " + ";
                                                    }
                                                    ?>
                                            <?php }
                                            }
                                            ?>
                                        </div>
                                    </td>
                                    <td style="width: 100px; text-align:right; padding-right:10px; vertical-align:middle; font-size: 14px;"><?php echo $this->ion_auth->formatMoney($rown->gross_total); ?></td>
                                </tr>  
                               <?php  }  ?>
                                <tr style="height: 150px; ">
                                    <td colspan="7" style="  background-color: #fff; font-size: 14px; border: 1px solid #fff!important;vertical-align: bottom;">
                                        <div class="pull-right">
                                            <?php echo "Page ".$m." of ".$numOfPage;?>
                                        </div>
                                    </td>
                                </tr>
                        </tbody> 

                    </table>  
                    <?php  }  }  ?>
                    
                </div>   
                <table width="40%" align="right"> 
                    <tr>
                    <td width="34%" valign="top">
                        <div style="height:22px;"></div> 
                        <table width="100%" class="table-bordered" style="background-color:#f5f5f5;" border="1">

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
                                echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . 'Total Invoice Value' . '</td><td style="text-align:right; padding-right:10px;">' . $this->ion_auth->formatMoney($inv->inv_total) . '</td></tr>';
                            }
                            ?>
                            <?php echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . 'Previous Balance' . '</td><td style="text-align:right; padding-right:10px;">' . $this->ion_auth->formatMoney($cusPreAmount) . '</td></tr>'; ?>

                            <?php
                            //if(DISCOUNT_OPTION == 1 || DISCOUNT_OPTION == 2) { 
                            //echo '<tr><td colspan="'.$col.'" style="text-align:right; padding-right:10px;;">'.$this->lang->line("discount").' ('. CURRENCY_PREFIX.')</td><td style="text-align:right; padding-right:10px;">'.$this->ion_auth->formatMoney($inv->inv_discount).'</td></tr>'; } 
                            ?>
                            <?php //if(TAX1) { echo '<tr><td colspan="'.$col.'" style="text-align:right; padding-right:10px;;">'.$this->lang->line("product_tax").' ('. CURRENCY_PREFIX.')</td><td style="text-align:right; padding-right:10px;">'.$this->ion_auth->formatMoney($inv->total_tax).'</td></tr>'; }  ?>
                            <?php
                            if (TAX2) {
                                echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . 'VAT' . '</td><td style="text-align:right; padding-right:10px;">' . $this->ion_auth->formatMoney($inv->total_tax2) . '</td></tr>';
                            }
                            ?>
                            <?php
                            if ($inv->shipping != 0) {
                                echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . $this->lang->line("shipping") . ' (' . CURRENCY_PREFIX . ')</td><td style="text-align:right; padding-right:10px;">' . $this->ion_auth->formatMoney($inv->shipping) . '</td></tr>';
                            }
                            ?>

                            <?php
                            //$netTotal = $customer_Pre_Balance + ($inv->total + $inv->total_tax2);
                            ?>  

                            <?php
                            if (TAX2) {
                                echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . '<b>Total Amount Due</b>' . ' (<b>' . CURRENCY_PREFIX . '</b>)</td><td style="text-align:right; padding-right:10px;"><b>' . $this->ion_auth->formatMoney($cusLatestAmount) . '</b></td></tr>';
                            }
                            ?>

                        </table> 
                    </td>
                    </tr>
                </table> 
                <?php if($numOfPage>1) { ?>
                    <div class="pull-right" style="clear: both;">
                         <?php echo "Page ".$m." of ".$numOfPage;?>
                    </div>
                <?php } ?>
            </div>
        </div>   
    </body>
</html>