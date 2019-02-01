external_url "https://" + ENV['DOMAINS'] + "/"
gitlab_rails['initial_root_password'] = File.read('/run/secrets/gitlab_root_password')
gitlab_rails['lfs_enabled'] = true
gitlab_rails['gitlab_shell_ssh_port'] = 9022