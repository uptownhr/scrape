<?php

/*require_once 'Zend/Loader/Autoloader.php';
$autoloader = Zend_Loader_Autoloader::getInstance();*/

class Scrape{

    protected $url = false;
    protected $category_id = false;
    protected $source = false;
    protected $fetcher = false;
    protected $parser = false;

    public function __construct(){

    }

    public function setSource($source){
        $required = array('url','category_id');

        foreach($required as $req){
            if( !array_key_exists($req, $source) ){
                return false;
            }
        }

        $this->source = $source;
    }

    public function consume(){

        $res = false;
        if( empty($this->source) ){
            return false;
        }

        $fetch_res = $this->fetch();

        if($fetch_res){

            $res = $this->parse();
        }

        return $res;
    }

    public function fetch(){
        $fetcher_class = 'Scrape_' . $this->source['fetcher'];

        $this->fetcher = new $fetcher_class();
        $this->fetcher->setUrl($this->url);
        $res = $this->fetcher->consume();

        return $res;
    }

    public function parse(){
        $res = false;

        $parser_class = 'Scrape_' . $this->source['parser'];
        $this->parser = new $parser_class();
        $this->parser->setRawData($this->fetcher->getRawData());

        $res = $this->parser->parse();

        return $res;
    }

    public function getParsedData(){
        return $this->parser->getParsedData();
    }
}