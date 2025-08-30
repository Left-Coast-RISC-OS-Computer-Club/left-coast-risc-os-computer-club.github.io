// Import PageFindUI

// Function to extract query parameters from the URL
function getQueryParam(name) {
  const urlParams = new URLSearchParams(window.location.search);
  return urlParams.get(name);
}

// Extract the query parameter
const searchQuery = getQueryParam('q');

// Function to update the URL with the search query
function updateURLWithQuery(query) {
  const newUrl = new URL(window.location.href);
  newUrl.searchParams.set('q', query);
  window.history.pushState({ path: newUrl.href }, '', newUrl.href);
}

// When the page is fully loaded setup the PageFindUI object
window.addEventListener('DOMContentLoaded', (event) => {
    const searchUI = new PagefindUI({
        element: "#search",
        highlightParam: "highlight",
        mergeIndex: [
            {
                bundlePath: "https://left-coast-risc-os-computer-club.github.io/pagefind",
                baseUrl: "/"
            }
        ],
        processTerm: (term) => {
            updateURLWithQuery(term);
            return term;
        }
    });

    if (searchQuery) {
        searchUI.triggerSearch(searchQuery);
    }
});

