window.addEventListener("load", function(){
    for (const a of document.body.getElementsByTagName("a")){
        // Open external links in new tabs
        if (a.href.length > 0 && new URL(a.href).origin !== location.origin){
            a.setAttribute("target", "_blank");
        }

        // // Replace identical subsequent references with "id."
        // if (a.href.length > 0 && new URL(a.href).pathname.endsWith("/refs/")){
        //     if (prevref === a.innerText){
        //         a.innerHTML = "<em>id.</em>";
        //     } else {
        //         prevref = a.innerText;
        //     }
        // }
    }

    // Don't cite more than 20 names total in a single citation
    for (const citation of document.querySelectorAll(".citation li div")){
        var r = /^((.*?; ){19}).*? and /;
        if (citation.innerHTML.match(r)){
            citation.innerHTML = citation.innerHTML.replace(r, "$1... and ");
        }
    }

    // Make the edit link show the plain view so it is quicker to add line-level comments
    document.querySelector('a[title^="Edit"]').href += "?plain=1";

    // Reword "search docs" to "search course"
    document.getElementById("documenter-search-query").innerText = "🔬🔭🔍 Search Course";
});