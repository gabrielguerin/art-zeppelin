require("jquery")
Bloodhound = require("packs/typeahead.bundle")

$(document).on('turbolinks:load', function () {
    var blog = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.whitespace,
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
            url: '/blog/autocomplete?search=%SEARCH',
            wildcard: '%SEARCH'
        }
    });
    $('#search').typeahead(null, {
        source: blog
    });
})