$('document').ready(function () {
    $('#refreshBtn').click(function(){
        // reading parameters for the request
        var from = $('#fromInput')[0].value;
        var to = $('#toInput')[0].value;

        $.getJSON('sales', {'from': from, 'to': to}, function(data){
            // set table visibility, remove obsolete data
            $('table#main-table').css('visibility', 'visible');
            $('table#main-table tbody tr').remove();

            // append data to table (tbody)
            var table_body = $('tbody');
            data['goods'].forEach (function (good){
                table_body.append('<tr class="goods">\n' +
                    '      <td>'+ good['title'] + '</td>\n' +
                    '      <td>'+ good['revenue'] + '</td>\n' +
                    '    </tr>');
            });

            // append total value to table (tbody)
            table_body.append('<tr class="table-info total">\n' +
                '          <td>Total</td>\n' +
                '          <td>'+ data['total_revenue'] + '</td>\n' +
                '        </tr>')

        }).fail(function(jqXHR) {
            if (jqXHR.status === 422) {
                alert(JSON.parse(jqXHR.responseText)['error']);
            }
        })
    });
});
