import "owl.carousel";

function initCarousel() {
var r =$('.carousel_in')

r.owlCarousel({
        center: true,
        items:1,
        loop:true,
       autoplay:true,
       navText: [ '', '' ],
      addClassActive: true,
        margin:5,
        responsive:{
            600:{
                items:1
            },
         1000:{
                items:2,
          nav:true,
            }
        }
    });

}

export {initCarousel};
