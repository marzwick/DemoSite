window.addEventListener("load", function(){
    let prevref = "";
    for (const a of document.body.getElementsByTagName("a")){
        // Open external links in new tabs
        if (a.href.length > 0 && new URL(a.href).origin !== location.origin){
            a.setAttribute("target", "_blank");
        }

        // Replace identical subsequent references with "id."
        if (a.href.length > 0 && new URL(a.href).pathname.endsWith("/refs/")){
            if (prevref === a.innerText){
                a.innerHTML = "<em>id.</em>";
            } else {
                prevref = a.innerText;
            }
        }
    }

    // Reword "search docs" to "search course"
    document.getElementById("documenter-search-query").innerText = "🔬🔭🔍 Search Course";
});