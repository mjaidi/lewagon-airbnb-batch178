import "bootstrap";
import "jquery-ui/ui/widgets/datepicker";
import { initUpdateNavbarOnScroll } from "../pages/navbar";
import { loadDynamicBannerText } from '../pages/banner';



loadDynamicBannerText();
initUpdateNavbarOnScroll();
$(".datepicker-ui").datepicker();
