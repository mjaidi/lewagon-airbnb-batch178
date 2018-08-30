import "bootstrap";
import "jquery-ui/ui/widgets/datepicker";
import { initUpdateNavbarOnScroll } from "../pages/navbar";
import { loadDynamicBannerText } from '../pages/banner';
import "../pages/dropzone";




loadDynamicBannerText();
initUpdateNavbarOnScroll();
$(".datepicker-ui").datepicker();
