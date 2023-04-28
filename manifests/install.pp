# @summary Install rbldnsd
# @api private
class rbldnsd::install {
  package { $rbldnsd::package_name:
    ensure => $rbldnsd::package_ensure,
  }
}
