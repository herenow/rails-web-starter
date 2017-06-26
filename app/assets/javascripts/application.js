// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

document.addEventListener('turbolinks:load', function() {
  // Initialize auth0 locks
  var lock = new Auth0Lock(
    AppConfig.auth0_client_id,
    AppConfig.auth0_domain,
    {
      language: 'en',
      languageDictionary: {
        title: 'RailsWebStarter',
      },
      auth: {
        redirectUrl: AppConfig.auth0_redirect_url,
        responseType: 'code',
        params: {
          scope: 'openid email' // Learn about scopes: https://auth0.com/docs/scopes
        }
      }
    }
  );

  function openAuth0Lock() {
    event.preventDefault();

    lock.show();

    return false;
  }

  Array.from(document.querySelectorAll('[data-auth0-lock]')).forEach(function(el) {
    el.addEventListener('click', openAuth0Lock);
  });
});
