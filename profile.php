<?php
        include "conn.php";
        

        $username = $_POST["username"];
        //$username = '081122334455';


        //$aSQL = "SELECT * FROM t_user WHERE username='".$username."'";
        $aSQL = "SELECT * FROM t_user WHERE username=$username";
        
        $result=array();
        
        $aQResult=mysqli_query($connect, $aSQL);
        while ($aRow = mysqli_fetch_array($aQResult))
        {
        $result[]=$aRow;
        $name1=$aRow['name'];
        }

if($name1 == null)
{
        echo json_encode($result);
        
}else if($name1 != null)
{
        echo json_encode($result);
}
;
?>

