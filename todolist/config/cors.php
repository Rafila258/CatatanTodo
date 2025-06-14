<?php

return [

'paths' => ['api/*'],

'allowed_methods' => ['*'],

'allowed_origins' => ['*'], // atau ganti dengan domain tertentu: ['https://example.com']

'allowed_origins_patterns' => [],

'allowed_headers' => ['*'],

'exposed_headers' => [],

'max_age' => 0,

'supports_credentials' => false,

];
