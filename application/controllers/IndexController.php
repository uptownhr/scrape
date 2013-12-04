<?php

class IndexController extends My_Controller {

    public function init(){
        parent::init();
    }

    public function indexAction(){
        $this->view->posts = Jien::model("Post")->withPager($this->params('page', 1))->get();
    }

}
