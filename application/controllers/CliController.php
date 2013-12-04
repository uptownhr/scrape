<?php

class CliController extends Jien_Controller {

    public function init(){
        parent::init();
    }

    public function googleRssAction(){
        $url = "https://news.google.com/news/feeds?q=bitcoin&output=rss";
        $channel = new Zend_Feed_Rss($url);

        // record through posts and save to $results array
        if($channel){
            foreach($channel AS $item){
                $title = $item->title();
                if(is_array($title)){
                    $title = $title[0]->nodeValue;
                }
                $link = $item->link();
                $body = $item->description();
                $url = $parse = parse_url($link);
                //$date = $item->pubDate();
                //$body = strip_tags($body);

                $result = array(
                    'title' => $title,
                    'url' => $link,
                    'body' => $body,
                    'author' => 'Tommy Lee',
                    'domain' => $url['host']
                );

                try{ Jien::model('Post')->save($result); } catch (Exception $e){
                    echo $e->getMessage();
                    echo "duplicate: " . $link . "\r\n\r\n";
                }
            }
        }

        exit;
    }
}