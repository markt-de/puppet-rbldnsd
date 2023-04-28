# @summary Configure rbldnsd
# @api private
class rbldnsd::config {
  if $rbldnsd::manage_config {
    file { $rbldnsd::config_file:
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      tag    => 'rbldnsd_config',
      notify => Service[$rbldnsd::service_name],
    }

    if $rbldnsd::config_source {
      File <| tag == 'rbldnsd_config' |> {
        source => $rbldnsd::config_source
      }
    } else {
      if $rbldnsd::zones {
        File <| tag == 'rbldnsd_config' |> {
          content => template($rbldnsd::config_template)
        }
      } else {
        fail("No zones defined in ${module_name} backend")
      }
    }
  }
}
