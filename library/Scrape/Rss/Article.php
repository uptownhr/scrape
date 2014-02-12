<?php

class Scrape_Rss_Article{

    protected $parsed_data = false;
    protected $raw_data = false;

    public function __construct(){

    }

    public function setRawData($rss){
        $this->raw_data = $rss;
    }

    public function parse(){

        if( $this->raw_data !== false ){

            //parse RSS
            //re-use Zend_Rss_Feed using the second parameter

            //extract articles from rss
            //http://framework.zend.com/manual/1.12/en/zend.feed.consuming-rss.html

            try{
                $rss = new Zend_Feed_Rss(null, $this->raw_data);
            }catch(Exception $e){
                echo $e->getMessage();
                return false;
            }

            $res = false;
            foreach($rss as $item){
                $res[] = array(
                    'title' => $item->title(),
                    'link' => '',
                    'description' => '',
                    'author' => '',
                    'category' => '',
                    'pubDate' => ''
                );
            }

            $this->parsed_data = $res;
            return $res;
        }else{
            return false;
        }
    }

    public function getParsedData(){
        return $this->parsed_data;
    }
}