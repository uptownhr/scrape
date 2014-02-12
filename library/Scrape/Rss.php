<?php

Class Scrape_Rss{

    protected $url = false;
    protected $raw_data = false;

    public function __construct(){

    }

    public function setUrl($url){
        $this->url = $url;
    }

    public function consume(){
        //use Zend_Feed_Rss();
        //checkout CliController ScrapeAction
        //use method saveXml() to get the raw rss string from Zend_Feed_Rss

        $this->raw_data = '<?xml version="1.0" encoding="UTF-8" ?>
<rss version="2.0">

<channel>
  <title>W3Schools Home Page</title>
  <link>http://www.w3schools.com</link>
  <description>Free web building tutorials</description>
  <item>
    <title>RSS Tutorial</title>
    <link>http://www.w3schools.com/rss</link>
    <description>New RSS tutorial on W3Schools</description>
  </item>
  <item>
    <title>XML Tutorial</title>
    <link>http://www.w3schools.com/xml</link>
    <description>New XML tutorial on W3Schools</description>
  </item>
</channel>

</rss>';

        //only return true if successful
        return true;
    }

    public function getRawData(){
        return $this->raw_data;
    }
}