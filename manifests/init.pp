# @summary Module to manage rbldnsd
#
# @param config_file
#   The absolute path to the target configuration file.
#
# @param config_source
#   Specifies an alternative source for the configuration file. If this
#   is specified it is used instead of a template-generated configuration.
#
# @param config_template
#   The template that will be used to generate the configuration file.
#
# @param listener
#   Specifies the interface/ip on which rbldnsd should listen
#
# @param manage_config
#   Whether the configuration file should be managed.
#
# @param package_ensure
#   The desired state for the package.
#
# @param package_name
#   The name of the package to install.
#
# @param service_ensure
#   The desired state for the service.
#
# @param service_enable
#   Whether to enable service startup on boot.
#
# @param service_name
#   The name of the service.
#
# @param zones
#   Specifies the zones that should be managed by rbldnsd
#
class rbldnsd (
  String $config_file,
  String $config_template,
  String $listener,
  Boolean $manage_config,
  String $package_ensure,
  String $package_name,
  Boolean $service_enable,
  String $service_ensure,
  String $service_name,
  Array $zones,
  Optional[String] $config_source = undef,
) {
  class { 'rbldnsd::install': }
  -> class { 'rbldnsd::config': }
  ~> class { 'rbldnsd::service': }
}
