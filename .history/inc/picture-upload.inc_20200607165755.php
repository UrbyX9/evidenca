<?php
    session_start();

    function image_upload($animal_id, $url){
        include_once("./dbh.inc.php");
        $pdo = pdo_connect_mysql();
        $target_dir = "../uploads/";
        $relative_dir = "./uploads/";

        echo "IN ";
        $change_name = date("Y-m-d-h-i-s")."-".$animal_id."-".basename($url);
        $target_file = $target_dir . $change_name;
        $relative_file = $relative_dir . $change_name;
        echo"SECOND ";
        $uploadOk = 1;
        $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

        if(isset($_POST["submit"])) {
            $check = getimagesize($url);
            if($check !== false) {
                //echo "File is an image - " . $check["mime"] . ".";
                $uploadOk = 1;
                echo "OK1 ";
            } else {
                //echo "File is not an image.";
                $uploadOk = 0;
                ECHO "NOT1 ";
            }
        }

        if ($url > 5000000) {
            $uploadOk = 0;
            echo "SIZE ";
        }

        if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
        && $imageFileType != "gif" ) {
            $uploadOk = 0;
            echo"IMG_TYPE1 ";
        }

        if ($uploadOk == 1) {
            if (move_uploaded_file($url, $relative_file)) {
                //vse je ok, zapišem še v bazo
                echo"INSRT";
                $query = "INSERT INTO photos (fk_idanimals, url) VALUES (?,?)";
                $stmt = $pdo->prepare($query);
                $stmt->execute([$animal_id, $relative_file]);
            } 
        }
    }

?>