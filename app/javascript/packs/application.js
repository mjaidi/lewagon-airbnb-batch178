import "bootstrap";
import "jquery-ui/ui/widgets/datepicker";
import { initUpdateNavbarOnScroll } from "../pages/navbar";
import { loadDynamicBannerText } from '../pages/banner';



loadDynamicBannerText();
initUpdateNavbarOnScroll();
$(".datepicker-ui").datepicker();

function differenceInDays (d1,d2){
  let date1 = new Date(d1);
  let date2 = new Date(d2);

  let timeDiff = Math.abs(date2.getTime() - date1.getTime());
  return Math.ceil(timeDiff / (1000 * 3600 * 24));
}


$("#submitBtn").click(function() {
  let days = differenceInDays($("#checkin").val(), $("#checkout").val());
  let people = $("#adultsAmount").val();
  let price = $("#price")[0].innerHTML;
  console.log("done > " + days + 'and' + people + 'and' + price);
  $("#totalBookngPrice")[0].innerHTML = ( days * people * price );
});


window.differenceInDays = differenceInDays;
