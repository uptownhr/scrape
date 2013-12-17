<?php

class CliController extends Jien_Controller {

    public function init(){
        parent::init();
    }

    public function twitterAction(){
        $sites = Jien::model("Site")->get()->rows();

        foreach($sites as $site){
            $twitter = false;
            if( !empty($site['consumerKey']) ){
                $posts = Jien::model("Post")->leftJoin('Scrapesource')->where("post.site_id='{$site['site_id']}'")->orderBy('post.date DESC')->get()->rows();
                $post = $posts[0];
                $tweet = $this->limitstr($post['title'],84);

                //main hash
                $tweet .= ' #' . $post['name'];
                //url
                $tweet .= ' http://' . $site['site_url'] . '/post/view/' . $post['post_id'];
                echo $tweet; exit;
                try{
                    $twitter = new Twitter(
                        $site['consumerKey'],
                        $site['consumerSecret'],
                        $site['accessToken'],
                        $site['accessTokenSecret']
                    );
                    $twitter->send("testing");
                }catch(Exception $e){

                    echo $e->getMessage();
                }

            }
        }

        exit;
    }

    function limitstr($str,$maxlength=20,$additional="...")
    {
        return (strlen($str)>$maxlength)? substr($str,0,$maxlength).$additional : $str;
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
                            'scrapesource_id' => $source['scrapesource_id'],
                            'site_id' => $source['site_id'],
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