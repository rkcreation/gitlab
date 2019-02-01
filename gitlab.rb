external_url "https://" + ENV['DOMAINS'] + "/"
gitlab_rails['initial_root_password'] = File.read('/run/secrets/gitlab_root_password')
gitlab_rails['lfs_enabled'] = true
gitlab_rails['gitlab_shell_ssh_port'] = 9022
letsencrypt['enable'] = false
nginx['listen_port'] = 80
nginx['listen_https'] = false
nginx['proxy_set_headers'] = {  "X-Forwarded-Proto" => "https", "X-Forwarded-Ssl" => "on" }
