import "bootstrap";
import "jquery-ui/ui/widgets/datepicker";
import { initUpdateNavbarOnScroll } from "../pages/navbar";
import { loadDynamicBannerText } from '../pages/banner';
import "../pages/dropzone";




loadDynamicBannerText();
initUpdateNavbarOnScroll();
/* French initialisation for the jQuery UI date picker plugin. */
/* Written by Keith Wood (kbwood{at}iinet.com.au) and Stéphane Nahmani (sholby@sholby.net). */
jQuery(function($){
  $.datepicker.regional['fr'] = {
    closeText: 'Fermer',
    prevText: '&#x3c;Préc',
    nextText: 'Suiv&#x3e;',
    currentText: 'Aujourd\'hui',
    monthNames: ['Janvier','Fevrier','Mars','Avril','Mai','Juin',
    'Juillet','Aout','Septembre','Octobre','Novembre','Decembre'],
    monthNamesShort: ['Jan','Fev','Mar','Avr','Mai','Jun',
    'Jul','Aou','Sep','Oct','Nov','Dec'],
    dayNames: ['Dimanche','Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi'],
    dayNamesShort: ['Dim','Lun','Mar','Mer','Jeu','Ven','Sam'],
    dayNamesMin: ['Di','Lu','Ma','Me','Je','Ve','Sa'],
    weekHeader: 'Sm',
    dateFormat: 'dd-mm-yy',
    firstDay: 1,
    isRTL: false,
    showMonthAfterYear: false,
    yearSuffix: '',
    minDate: 0,
    maxDate: '+12M +0D',
    numberOfMonths: 2,
    showButtonPanel: true
    };
  $.datepicker.setDefaults($.datepicker.regional['fr']);
});


$(".datepicker-ui").datepicker();

function differenceInDays (d1,d2){
  d1 = d1.split("-")[1]+ "-" + d1.split("-")[0] + "-" + d1.split("-")[2];
  d2 = d2.split("-")[1]+ "-" + d2.split("-")[0] + "-" + d2.split("-")[2];
  let date1 = new Date(d1);
  let date2 = new Date(d2);

  let timeDiff = Math.abs(date2.getTime() - date1.getTime());
  return Math.ceil(timeDiff / (1000 * 3600 * 24));
}


$("#submitBtn").click(function() {
  let days = differenceInDays($("#checkin").val(), $("#checkout").val());
  let people = $("#adultsAmount").val();
  let price = $("#price")[0].innerHTML;
  console.log("done > " +$("#checkin").val())
  console.log("done > " +$("#checkout").val())
  console.log("done > " + days + 'and' + people + 'and' + price);
  $("#totalBookngPrice")[0].innerHTML = "$"+ ( days * people * price );
});

$("#comfirm").click(function(){
$("#confirmationForm").submit();
});



window.differenceInDays = differenceInDays;
