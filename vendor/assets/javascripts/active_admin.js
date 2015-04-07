//= require active_admin/base


$(document).ready(function() {
  $('#QC').hide();
  $('#ON').hide();
  $('#montreal').hide();
  $('#property_province').on('change', function() {
    var province;
    province = this.value;
    if (province === 'Ontario') {
      $('#QC').hide();
      $('#ON').show();
    } else if (province === 'Quebec') {
      $('#QC').show();
      $('#ON').hide();
    } else {

    }
  });
  $('#property_city').on('change', function() {
    var city;
    city = this.value;
    if (city === 'Montreal') {
      $('#montreal').show();
    } else {
      $('#montreal').hide();
    }
  });
});
