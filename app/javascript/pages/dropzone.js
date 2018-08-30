import * as Dropzone from "dropzone";

console.log("dropzone start initialisation");

Dropzone.options.newApartment = {
    paramName: "apartment[photo]", // The name that will be used to transfer the file
    maxFilesize: 3, // MB
    init: function() {
        this.on("success", function(file, response) { console.log(response); });
        this.on("removedfile", function(file, response) { console.log("=> " + response); });
    }
};
console.log("dropzone initialized");