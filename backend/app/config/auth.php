<?php

return [
    'guards' => [
        'web' => [
            'driver' => 'session',
            'provider' => 'users',
        ],

        'drivers-web' => [
            'driver' => 'session',
            'provider' => 'drivers',
        ],

        'api' => [
            'driver' => 'passport', //previously "token"
            'provider' => 'users', //This will be switched regularly from the middleware between drivers and users
        ],

        'drivers-api' => [
            'driver' => 'passport', //previously "token"
            'provider' => 'drivers',
        ],
    ],
]

?>
