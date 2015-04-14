#= require active_admin/base

$(document).ready ->
  $('#QC').hide()
  $('#ON').hide()
  $('#montreal').hide()
  
  $('#property_province').on 'change', ->
    province = @value
    if province == 'Ontario'
      $('#QC').hide()
      $('#ON').show()
    else if province == 'Quebec'
      $('#QC').show()
      $('#ON').hide()
    else
      $('#QC').hide()
      $('#ON').hide()
    return
  $('#property_city').on 'change', ->
    city = @value
    if city == 'Montreal'
      $('#montreal').show()
    else
      $('#montreal').hide()
    return
  return