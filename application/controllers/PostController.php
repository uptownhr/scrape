<?php

class PostController extends My_Controller {

    public function init(){
        parent::init();
    }

    public function viewAction(){
        $this->view->post = Jien::model("Post")->get($this->params('id'));
    }

    public function rssAction(){
        $posts = Jien::model("Post")->orderBy('post.created DESC')->limit(100)->get()->rows();

        /**
         * Create the parent feed
         */
        $feed = new Zend_Feed_Writer_Feed;
        $feed->setTitle($this->site->row('site_title'));
        $feed->setLink('http://'.$this->site->row('site_url'));
        $feed->setFeedLink('http://'.$this->site->row('site_url').'/post/rss', 'atom');
        $feed->addAuthor(array(
            'name'  => $this->site->row('site_title'),
            'email' => "jaequery@gmail.com",
            'uri'   => 'http://'. $this->site->row('site_url')
        ));
        $feed->setDateModified(time());
        $feed->addHub('http://pubsubhubbub.appspot.com/');

        /**
         * Add one or more entries. Note that entries must
         * be manually added once created.
         */

        foreach($posts AS $key=>$post){
            $entry = $feed->createEntry();
            $entry->setTitle($post['title']);
            $entry->setLink('http://'.$this->site->row('site_url') . '/post/view/id/' . $post['post_id']);
            $entry->addAuthor(array(
                'name'  => $this->site->row('site_title'),
                'email' => 'jaequery@gmail.com',
                'uri'   => 'http://'.$this->site->row('site_url'),
            ));
            $entry->setDateModified(time());
            $entry->setDateCreated(time());
            $entry->setDescription($post['body']);
            $feed->addEntry($entry);
        }


        /**
         * Render the resulting feed to Atom 1.0 and assign to $out.
         * You can substitute "atom" with "rss" to generate an RSS 2.0 feed.
         */
        $out = $feed->export('atom');
        echo $out;

        exit;
    }

    public function __call($method, $args){
        $this->_forward('view');
    }

}
