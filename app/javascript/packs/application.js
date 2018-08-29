import "bootstrap";
import { initUpdateNavbarOnScroll } from "../pages/navbar";
import { loadDynamicBannerText } from '../pages/banner';
import { initDropZone } from '../pages/form_dropzone';



loadDynamicBannerText();
initUpdateNavbarOnScroll();
initDropZone();