include_recipe "php"

# Install extra modules for PHP
%w{php5-mysql php5-xsl php5-gd php5-curl}.each do |pkg|
  package pkg do
    action :install
  end
end

# Install Apache's mod_php5 only if Apache is installed
# TODO: Remove the 'true' statement. It's a workaround to bypass the detection
# of Apache. Apache is not being detected in the first 'vagrant up', but it is
# detected in the second provision.
# Alternatives to detect Apache could be:
# * system('apache2 -v')
# * File.directory?(node[:apache][:dir])
if true && system("type 'apache2'")
  include_recipe "apache2::mod_php5"
  log "Restart Apache after installation of mod_php5" do
    level :info
    notifies :restart, resources("service[apache2]"), :delayed
  end
end
