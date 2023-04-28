# @summary Manage rbldnsd service
# @api private
class rbldnsd::service {
  service { $rbldnsd::service_name:
    ensure     => $rbldnsd::service_ensure,
    enable     => $rbldnsd::service_enable,
    hasrestart => true,
    hasstatus  => false,
  }
}
