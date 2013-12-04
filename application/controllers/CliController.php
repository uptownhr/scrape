<?php

class CliController extends Jien_Controller {

    public function init(){
        parent::init();
    }

    public function scrapeAction(){

        $sources = Jien::model('Scrapesource')->get()->rows();

        foreach($sources as $source){
            echo "Scraping URL:" . $source['url'] . "\r\n\r\n";
            if( $source['parser'] == 'rss' ){
                try{
                    $response = new Zend_Feed_Rss($source['url']);
                }catch(Exception $e){
                    echo "ERROR URL: " . $source['url'] . "\r\n";
                }


                if($response){
                    foreach($response as $item){

                        $title = $item->title();
                        if(is_array($title)){
                            $title = $title[0]->nodeValue;
                        }

                        $result = array(
                            'source_id' => $source['scrapesource_id'],
                            'title' => $title,
                            'url' => $item->link(),
                            'body' => $item->description(),
                            'author' => $source['name']
                        );

                        print_r($result);

                        try{
                            $res = Jien::model('Post')->save($result);
                        }catch(Exception $e){

                        }
                    }
                }else{
                    echo "Error Getting Content: " . $source['url'] . "\r\n";
                }
            }else{
                echo "Skipping: " . $source['url'] . "\r\n";
            }

        }
        exit;
    }
}