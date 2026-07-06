<?php

require_once "ia.php";


function demanderGemini($prompt){


$url =
"https://generativelanguage.googleapis.com/v1beta/models/"
.GEMINI_MODEL.
":generateContent?key=".GEMINI_API_KEY;



$data=[

"contents"=>[
    [
        "parts"=>[
            [
                "text"=>$prompt
            ]
        ]
    ]
]

];



$options=[

"http"=>[

"method"=>"POST",

"header"=>
"Content-Type: application/json\r\n",

"content"=>json_encode($data),

"ignore_errors"=>true

]

];



$context=stream_context_create($options);



$result=file_get_contents(
$url,
false,
$context
);



if($result===false){

    return null;

}



return json_decode($result,true);


}

?>