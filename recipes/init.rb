include_recipe "apt"
include_recipe "vim"

# Mount any configured SAMBA shared directory
# http://jsosic.wordpress.com/2012/08/13/accessing-host-filesystem-from-virtualbox-guest/
if node[:smbfs][:install] === true
  node[:smbfs][:mounts].keys.each do |mount_point|
    directory mount_point do
      recursive true
      action :create
    end
  end
  include_recipe "smbfs::attribute_driven"
end

# If there is no workspace, set the first SAMBA shared directory as workspace
if !node[:smbfs][:mounts].empty? && File.directory?(node[:smbfs][:mounts].keys[0])
  link node[:core][:workspace_path] do
    to node[:smbfs][:mounts].keys[0]
    only_if { !File.exist?(node[:core][:workspace_path]) }
  end
end

# If there is no workspace, set the vagrant shared directory as workspace
if File.directory?(node[:vagrant][:workspace_path])
  link node[:core][:workspace_path] do
    to node[:vagrant][:workspace_path]
    only_if { !File.exist?(node[:core][:workspace_path]) }
  end
end

# If there is no workspace, create one
directory node[:core][:workspace_path] do
  recursive true
  action :create
  only_if { !File.exist?(node[:core][:workspace_path]) }
end
