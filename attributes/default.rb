# Vagrant Settings
default[:vagrant][:workspace_path] = '/opt/vboxsf/workspace'

# Core settings
default[:core][:workspace_path] = '/opt/workspace'

# SAMBA Settings
default[:smbfs][:install] = false

# Apache2 Settings
normal[:apache][:user]             = 'vagrant'
normal[:apache][:group]            = 'vagrant'
normal[:apache][:host_name]        = 'example.com'
normal[:apache][:aliases]          = ['www.example.com']
normal[:apache][:listen_addresses] = '*'
normal[:apache][:listen_ports]     = ['80']
normal[:apache][:project_web_path] = node[:core][:workspace_path]
