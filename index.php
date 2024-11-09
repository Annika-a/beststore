<?php
echo "<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />";

echo "<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 95%;
}
div{
padding: 1.1em;
border: 1px solid #00b33c;
}
td, th {
  border: 1px solid #7FFFD4;
  text-align: left;
  padding: 3px;
}
H3 {
  font-family: arial, sans-serif;
  color: #00b33c;
}
</style>
<link rel=\"icon\" type=\"image/png\" href=\"/img/favicon-96x96.png\" sizes=\"96x96\" />";

$servername = "xxx";
$username = "xxx";
$password = "xxx";
//extra db with all data to get country_names:
$dbname = "if0_37641745_beststuffstore";

// Create connection
$conn1 = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn1->connect_error) {
    die("Connection failed: " . $conn1->connect_error);
}

$sql = "select * from STORE_COUNTRY";
$result = $conn1->query($sql);

echo "<br> <form method=\"post\"><label><H3>Select Database:</H3></label> <select name=\"countrydatabases\" id=\"countrydatabases\">";
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<option value=". $row["country_id"]. ">". $row["country_id"]. " ".$row["country_name"]. "</option>";
    }
} else {
    echo "0 results";
}   
 echo "</select><input type=\"submit\" name=\"submit\" value=\"select\"></form><br> ";
 
 //where warehouse_id = '$selectOption'";
if(isset($_POST['submit'])){
 
//Warehouse
$selectOption = $_POST['countrydatabases'];
 
$message = "";

 

//Select databse connection
switch ($selectOption) {
  case 1:
        $message = " No database ";
    break;
    case 2:
        $databasename = "if0_37641745_sweden"; 
        $message = " Database number:  ";
    break;
    case 3:
         $message = " No database ";
    break;
    case 4: 
        $databasename = "if0_37641745_brazil";
         $message = " Database number:  ";
    break;
    case 5:
        $databasename = "if0_37641745_usa"; 
         $message = " Database number:  ";
    break; 
    case 6:
        $databasename = "if0_37641745_japan";
         $message = " Database number:  ";
    break; 
  default:
    //code block
} 
$conn = new mysqli($servername, $username, $password, $databasename);
$conn->set_charset("utf8");

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

echo "<div> <H3>".  $message. " ". $selectOption . " ". "</H3></div> ";

//Store country
$sql2 = "select * from STORE_COUNTRY where country_id = '$selectOption'";
$result2 = $conn->query($sql2);

//Warehouse
$sql7 = "select * from WAREHOUSE";
$result7 = $conn->query($sql7); 

//Shipments
$sql3 = "select * from SHIPMENT";
$result3 = $conn->query($sql3);

//Products
$sql4 = "select * from PRODUCT p join STORE_CATALOGUE sca ON p.product_id = sca.product_id
left join SELLER_STORE st on st.store_id = sca.store_id 
left join STORE_COUNTRY sc on sc.country_id = st.country_id
order by p.product_id";
$result4 = $conn->query($sql4);

//Product reviews
$sql5 = "select p.product_id, pr.review_time, pr.review_text, pr.rating, pr.customer_id
from PRODUCT_REVIEW pr 
left join PRODUCT p on p.product_id = pr.product_id";
$result5 = $conn->query($sql5);

$sql5b = "select product_id, product_name
from PRODUCT where product_id in(select product_id from PRODUCT_REVIEW)
order by product_id";
$result5b = $conn->query($sql5b);

$sql6 = "select order_id, customer_id, order_time, order_full_price, currency from ORDERS order by order_id";
$result6 = $conn->query($sql6);
 
$sql6b = "select ot.order_id, p.product_id, p.product_name,  ot.item_order_price, p.product_current_price 
from ORDER_ITEMS ot left join PRODUCT p on p.product_id = ot.product_id order by ot.order_id";
$result6b = $conn->query($sql6b);

$sql8 = "SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = '$databasename' ";
$result8 = $conn->query($sql8);

 
}
// brace for if(isset($_POST['submit']))

if ($result2->num_rows > 0) {  
    while($row = $result2->fetch_assoc()) { 
        $db_country = $row["country_name"];
}}


//Warehouse table
 echo "<div><br><H3>". $db_country ." database WAREHOUSE table</H3><table><tr> <th>warehouse_id</th> <th>location_country</th> <th>continent_name</th>  <th>warehouse_address</th> </tr>"; 
if ($result7->num_rows > 0) { 
    while($row = $result7->fetch_assoc()) {
        echo "<tr><td>". $row["warehouse_id"]. 
        "</td><td>". $row["location_country"]. 
        "</td><td>". $row["continent_name"].
        "</td><td>". $row["warehouse_address"]. "</td><tr>";
    }
} else {
    echo "0 results";
}
echo "</table></div>";

//Warehouse shipments
 echo "<div><br><H3>". $db_country ." database SHIPMENT table</H3><table><tr> <th>order_id</th> <th>customer_id</th> <th>shipment_status</th><th>packing_time</th> <th>shipment_time</th> <th>delivery_time</th> </tr>"; 
if ($result3->num_rows > 0) { 
    while($row = $result3->fetch_assoc()) {
        echo "<tr><td>". $row["order_id"]. 
        "</td><td>". $row["customer_id"]. 
        "</td><td>". $row["shipment_status"].
        "</td><td>". $row["packing_time"].
        "</td><td>". $row["shipment_time"].
        "</td><td>". $row["delivery_time"]."</td><tr>";
    }
} else {
    echo "0 results";
}
echo "</table></div>";

// Products in warehouse
 echo "<div><br><H3>". $db_country ." database PRODUCT, SELLER_STORE, STORE_CATALOGUE, STORE_COUNTRY</H3><table><tr> 
 <th>product_id</th> 
 <th>product_name</th> 
 <th>product_description</th> 
 <th>product_current_price</th> 
 <th>inventory</th> 
  <th>store_id</th> 
 <th>store_name</th>
 <th>seller_id</th>
 <th>country_name</th>  </tr>"; 
if ($result4->num_rows > 0) {
    while($row = $result4->fetch_assoc()) { 
       echo   
        "<tr><td>". $row["product_id"]. 
        "</td><td>". $row["product_name"]. 
        "</td><td>". $row["product_description"].
        "</td><td>". $row["product_current_price"]. " ".$row["currency"].
        "</td><td>". $row["inventory"].
        "</td><td>". $row["store_id"]. 
        "</td><td>". $row["store_name"].
        "</td><td>". $row["seller_id"].
        "</td><td>". $row["country_name"].  "</td><tr>";
    }
} else {
    echo "0 results";
}
echo "</table></div>";

//Product reviews
echo "<div><h3>". $db_country ." PRODUCT_REVIEW, PRODUCT</h3>";
echo "<table>
        <tr>
            <th>product_id</th> 
            <th>product_name</th>
            <th>Reviews [PRODUCT_REVIEW]</th>
        </tr>";
if ($result5b->num_rows > 0) {
    while ($productrow = $result5b->fetch_assoc()) {
        echo "<tr>
                <td>" . $productrow["product_id"] . "</td>
                <td>" . $productrow["product_name"] . "</td>
                <td>
                    <table>
                        <tr>
                            <th>review_time</th>
                            <th>customer_id</th>
                            <th style=\"width: 60%;\">review_text</th>
                            <th>rating</th>
                        </tr>";
        $ratingall = 0;
        $rowcount = 0;                
        mysqli_data_seek($result5, 0); 
        while ($reviewrow = $result5->fetch_assoc()) {
            if ($productrow["product_id"] == $reviewrow["product_id"]) {
                echo "<tr>
                         <td>". $reviewrow["review_time"] . "</td>
                        <td>". $reviewrow["customer_id"] . "</td>
                        <td>". $reviewrow["review_text"] . "</td>
                        <td>". $reviewrow["rating"] . "</td>
                    </tr>";
             $ratingall += $reviewrow["rating"];
             $rowcount += 1;
            }
        }
        echo "<tr><td></td><td></td><td><b>Rating all</b>: </td> <td>". $ratingall/ $rowcount."/5 </td></tr>";
        echo "</table></td></tr>";
    }
} else {
    echo "0 results";
}
echo "</table><br></div>";

 

  
//Orders
echo "<div><h3>". $db_country ." database ORDERS </h3>";

if ($result6->num_rows > 0) { 
    while ($row = $result6->fetch_assoc()) {
        echo "<table>
                <tr>
                    <th>order_id</th>
                    <th>customer_id</th>
                    <th>order_time</th>
                    <th>order_full_price</th>
                    <th>currency</th>
                    <th style=\"width: 60%;\">Products in order [ORDER_ITEMS, PRODUCT]</th>
                </tr>
                <tr>
                    <td>" . $row["order_id"] . "</td>
                    <td>" . $row["customer_id"] . "</td>
                    <td>" . $row["order_time"] . "</td>
                    <td>" . $row["order_full_price"] . "</td>
                    <td>" . $row["currency"] . "</td>
                    <td> <table>
                            <tr>
                                <th>product_id</th>
                                <th>product_name</th>
                                <th>item_order_price</th>
                                <th>product_current_price</th>
                            </tr>"; 
        mysqli_data_seek($result6b, 0);  
        while ($rowproduct = $result6b->fetch_assoc()) {
            // Check if the product's order_id matches the current order_id
            if ($row["order_id"] == $rowproduct["order_id"]) {
                echo "<tr>
                        <td>" . $rowproduct["product_id"] . "</td>
                        <td>" . $rowproduct["product_name"] . "</td>
                        <td>" . $rowproduct["item_order_price"] . "</td>
                        <td>" . $rowproduct["product_current_price"] . "</td>
                    </tr>";
            }
        }

        echo "    </table>
                </td>
            </tr>
        </table><br>";
    }
} else {
    echo "0 results";
}

echo "</div>";


 
 //database info
echo "<div><br><H3>". $db_country ." database tables INFORMATION_SCHEMA</H3><table><tr> 
<th>TABLE_SCHEMA</th> 
<th>TABLE_NAME</th>
<th>COLUMN_NAME</th>
<th>COLUMN_DEFAULT</th>
<th>COLUMN_COMMENT</th>
<th>IS_NULLABLE</th>
<th>DATA_TYPE</th> </tr>"; 
if ($result8->num_rows > 0) { 
    while($row = $result8->fetch_assoc()) {
        echo "<tr><td>". $row["TABLE_SCHEMA"]. 
        "</td><td>". $row["TABLE_NAME"]. 
        "</td><td>". $row["COLUMN_NAME"]. 
        "</td><td>". $row["COLUMN_DEFAULT"].
        "</td><td>". $row["COLUMN_COMMENT"]. 
        "</td><td>". $row["IS_NULLABLE"]. 
        "</td><td>". $row["DATA_TYPE"]. 
        "</td><tr>";
    }
} else {
    echo "0 results";
}
echo "</table></div>";


$conn->close();
?>
