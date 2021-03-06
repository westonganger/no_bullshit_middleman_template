var lunrIndex = null;
var lunrData  = null;

var search_field = $('input#search-field');

if(getParamByName('search_text')){
  search_field.val(getParamByName('search_text'));
}

function getParamByName(name, url) {
  if (!url) url = window.location.href;
  name = name.replace(/[\[\]]/g, "\\$&");
  var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
      results = regex.exec(url);
  if (!results) return null;
  if (!results[2]) return '';
  return decodeURIComponent(results[2].replace(/\+/g, " "));
}

function search(){
  var search_text = "*";
  if(search_field.val()){
    search_text += search_field.val() + "*";
  }

  if(lunrIndex == null){
    lunrIndex = lunr.Index.load(lunrData.index);
  }

  var results = lunrIndex.search(search_text).map(function(item){
    return lunrData.docs[item.ref];
  });

  var html = "";

  if(results.length == 0){
    html = "<hr><h2 class='text-center'>No Search Results</h2>";
  }else{
    results.forEach(function(item, i){
      html += "<hr><a href='"+item.url+"'><h2 class='post-title'>"+item.title+"</h2></a>";
    });
  }

  $('#search-results').html(html);
};

$.ajax({
  url: "/search.json",
  method: 'GET',
  cache: true,
  success: function(data){
    lunrData = data;
    search();
  }
});

$(function(){
  $('input#search-field').on('input', function(){
    search()
  });
});
