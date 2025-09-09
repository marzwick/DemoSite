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

    // Display alt text as figure captions
    let fig_no = 1;
    for (const img of document.querySelectorAll("img[alt]")){
        // Skip doing this on the site logo
        if (img.getAttribute("alt").startsWith("Scientific Teaching Course") && img.getAttribute("alt").endsWith("logo")) continue;

        // Otherwise, wrap the image in a figure and caption it
        const figure = document.createElement("figure");
        const figcaption = document.createElement("figcaption");
        const p = document.createElement("p");
        const strong = document.createElement("strong");
        const br = document.createElement("br");
        const span = document.createElement("span");
        img.parentNode.insertBefore(figure, img);
        img.parentNode.removeChild(img);
        figure.appendChild(img);
        figure.appendChild(figcaption);
        figcaption.appendChild(p);
        p.appendChild(strong);
        p.appendChild(br);
        p.appendChild(span);
        strong.innerText = `Figure ${fig_no++}.`;
        span.innerText = img.getAttribute("alt");
    }

    // Don't cite more than 20 names total in a single citation
    for (const citation of document.querySelectorAll(".citation li div")){
        var r = /^((.*?; ){19}).*? and /;
        if (citation.innerHTML.match(r)){
            citation.innerHTML = citation.innerHTML.replace(r, "$1... and ");
        }
    }

    // Make the edit link show the plain edit view so it is quicker to make line-level edits
    document.querySelector('a[title^="Edit"]').href += "?plain=1";
    document.querySelector('a[title^="Edit"]').href = document.querySelector('a[title^="Edit"]').href.replace("/blob/", "/edit/");

    // Reword "search docs" to "search course"
    document.getElementById("documenter-search-query").innerText = "🔬🔭🔍 Search Course";
});
