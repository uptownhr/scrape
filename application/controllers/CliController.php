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

                        $url = $item->link();
                        $domain = parse_url($url);
                        $domain = $domain['host'];

                        $date = date( 'Y-m-d G:i:s', strtotime($item->pubDate()) );

                        $result = array(
                            'source_id' => $source['scrapesource_id'],
                            'domain' => $domain,
                            'title' => $title,
                            'url' => $url,
                            'body' => $item->description(),
                            'author' => $source['name'],
                            'date' => $date
                        );

                        echo $date . "\r\n";

                        try{
                            $res = Jien::model('Post')->save($result);

                            if($res){
                                echo "saved $url \r\n\r\n";
                            }
                        }catch(Exception $e){
                            echo "dup $url \r\n\r\n";
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