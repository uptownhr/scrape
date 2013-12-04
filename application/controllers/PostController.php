<?php

class PostController extends My_Controller {

    public function init(){
        parent::init();
    }

    public function viewAction(){
        $this->view->post = Jien::model("Post")->get($this->params('id'));
    }

    public function __call($method, $args){
        $this->_forward('view');
    }

}
