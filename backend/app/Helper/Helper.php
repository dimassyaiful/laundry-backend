<?php
  
function makeReturnJson($status, $message = "", $code = 200)
{
    return response()->json([
        'isSuccess' => $status,
        'message' => $message
    ], $code);
}

function showExceptions($msg){ 
    //show exceptions only in env=>local
    $appenv = env('APP_ENV');
    if($appenv !== "local"){
        return;
    } 
    $message = "Error SQL => $msg";
    echo $message;
    exit;
}

function getInsertUpdateInfo($userId){
    $date = (new DateTime())->format('Y-m-d H:i:s');
    return [
        'insert_by' => $userId,
        'insert_at' => $date,
        'update_by' => $userId,
        'update_at' => $date,
    ];
}

function getUpdateInfo($userId){
    $date = (new DateTime())->format('Y-m-d H:i:s');
    return [ 
        'update_by' => $userId,
        'update_at' => $date,
    ];
}
     

?>