include_recipe "php"

# Install extra modules for PHP
%w{php5-mysql php5-xsl php5-gd php5-curl}.each do |pkg|
  package pkg do
    action :install
  end
end

# Install Apache's mod_php5 only if Apache is installed
if system("type 'apache2'")
  include_recipe "apache2::mod_php5"
  log "Restart Apache after installation of mod_php5" do
    level :info
    notifies :restart, resources("service[apache2]"), :delayed
  end
end
