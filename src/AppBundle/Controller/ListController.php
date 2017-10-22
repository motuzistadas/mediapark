<?php

namespace AppBundle\Controller;

use AppBundle\Base\BaseController;
//use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use AppBundle\Entity\Advertisement;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\Form\Extension\Core\Type;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Form\AdType;
use AppBundle\Entity\User;

class ListController extends BaseController
{
    /**
     * @Route("/", name="home")
     * @Template()
     */
    public function ListAction(Request $request)
    {

        $userAds = $request->query->get('myads'); 
        $filter = $request->query->get('filter');

        $request = $this->get('request_stack')->getMasterRequest();


        $qb = $this
           ->getDoctrine()->getManager()
           ->createQueryBuilder()
           ->select('g', 'g.title', 'g.description', 'g.postDate', 'u.username')
           ->from(Advertisement::class, 'g')
           ->leftJoin(User::class, 'u', "WITH", "u.id=g.userId")
        ;

        if ($filter && $userAds) {
            $qb
               ->where('(g.title LIKE :criteria OR g.description LIKE :criteria) AND g.userId = :usrId')
               ->setParameter('usrId', $userAds)
               ->setParameter('criteria', '%'.$filter.'%')
            ;
        }elseif($filter){
            $qb
               ->where('g.title LIKE :criteria OR g.description LIKE :criteria')
               ->setParameter('criteria', '%'.$filter.'%')
            ;
        }elseif($userAds){
             $qb
               ->where('g.userId = :usrId')
               ->setParameter('usrId', $userAds)
            ;
        } else;


        $em = $this->getDoctrine()->getManager();
        $ad = new Advertisement();

        $form = $this->createForm(AdType::class, $ad);

        $form->handleRequest($request);
        $msg = false;

        if($form->isSubmitted() && $form->isValid()){
            // Create the ad
            $msg = true;

            $ad->setPostDate(new \DateTime("now"));
            $user_id = $this->getUser()->getId();
            $ad->setUserId($user_id);
            $em->persist($ad);
            $em->flush();

            unset($ad); 
            unset($form); #clean form fields
            $ad = new Advertisement();
            $form = $this->createForm(AdType::class, $ad);

            $this->redirect('home');
        }

        return [
            'orderBy' => $this->orderBy($qb, Advertisement::class, 'g.postDate', 'DESC'),
            'pager'   => $this->getPager($qb),
            'form' => $form->createView(),
            'msg' => $msg,
        ];
    
    }

    public function checkCsrfToken($key, $token)
    {
        if ($token !== $this->get('security.csrf.token_manager')->getToken($key)->getValue()) {
            throw new InvalidCsrfTokenException('Invalid CSRF token');
        }
    }

    /**
     * @Route("/delete_order/{id}/{token}", name="admin_order_delete")
     * 
     */
    public function deleteAction(Request $request, $id, $token)
    {
        $this->checkCsrfToken('administration', $token);
        $manager = $this->getDoctrine()->getEntityManager();
        $entity = $manager->getRepository('AppBundle:Advertisement')->find($id);
        if (!$entity) {
            throw $this->createNotFoundException();
        }

        $em = $this->get('doctrine')->getManager();
        $em->remove($entity);
        $em->flush();

       // $this->success('admin.groups.deleted', ['%id%' => $entity->getId()]);

        return $this->redirect($this->generateUrl('list'));
    }


}
