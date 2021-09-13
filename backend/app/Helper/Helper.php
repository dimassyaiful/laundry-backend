<?php

function makeReturnJson($status, $message = "", $code = 200)
{
    return response()->json([
        'isSuccess' => $status,
        'message' => $message
    ], $code);
}
     

?>