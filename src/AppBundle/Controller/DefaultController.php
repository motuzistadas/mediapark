<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use AppBundle\Entity\User;



class DefaultController extends Controller
{

    /**
     * @Route("/", name="home")
     */
    public function indexAction()
    {
    		
    }


}
