var google_analytics_id = "";

if(google_analytics_id){

  var script = document.createElement('script');
  script.src = 'https://www.googletagmanager.com/gtag/js?id='+google_analytics_id;
  window.document.getElementsByTagName('head')[0].appendChild(script);
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', google_analytics_id);

  document.addEventListener('turbolinks:load', function(event){
    if (typeof gtag === 'function') {
      if(typeof gon !== 'undefined' && gon.user_id){
        gtag('set', { 'user_id': gon.user_id })
      }
      gtag('config', google_analytics_id, {
        'page_location': event.data.url
      });
    }
  });

}
