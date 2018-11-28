/*
- JS
- Alphabetize the books
- Can hardcode the button into an ERB file
- Can adjust controller to JSON data
- No page refresh
*/
$(function() {
  $('#sort-books').click(
    addFunction
  )
})

function addFunction(){
  $('#book-list').html("")
  fetch('/books.json')
  .then(function(response) {
    return response.json();
  })
  .then(books => {
    let allBooks = books['data'].sort(
      function(a, b) {
        var nameA = a['attributes']['title'].toUpperCase();
        var nameB = b['attributes']['title'].toUpperCase();
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }
        return 0;
      })
    allBooks.forEach(book => {
      $("#book-list").append( `${book['attributes']['title']} </br>`)
    })
  });
}
//ForEach reduce slice map sort filter
