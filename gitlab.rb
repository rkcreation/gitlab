external_url "https://" + ENV['DOMAIN']
registry_external_url "https://" + ( ENV.has_key?('DOMAIN_REGISTRY') ? ENV['DOMAIN_REGISTRY'] : ( 'registry.' + ENV['DOMAIN'] ) )
pages_external_url "https://" + ( ENV.has_key?('DOMAIN_PAGES') ? ENV['DOMAIN_PAGES'] : ( 'pages.' + ENV['DOMAIN'] ) )

gitlab_rails['initial_root_password'] = File.read('/run/secrets/gitlab_root_password').strip
gitlab_rails['lfs_enabled'] = true
gitlab_rails['gitlab_shell_ssh_port'] = ENV['GITLAB_SSH_PORT'] || 9022

letsencrypt['enable'] = false

nginx['listen_port'] = 80
nginx['listen_https'] = false
nginx['http2_enabled'] = false
nginx['proxy_set_headers'] = { "Host" => "$$http_host", "X-Real-IP" => "$$remote_addr", "X-Forwarded-For" => "$$proxy_add_x_forwarded_for", "X-Forwarded-Proto" => "https", "X-Forwarded-Ssl" => "on" }
registry_nginx['listen_port'] = 5100
registry_nginx['listen_https'] = false
registry_nginx['http2_enabled'] = false
registry_nginx['proxy_set_headers'] = { "Host" => "$$http_host", "X-Real-IP" => "$$remote_addr", "X-Forwarded-For" => "$$proxy_add_x_forwarded_for", "X-Forwarded-Proto" => "https", "X-Forwarded-Ssl" => "on" }
pages_nginx['listen_port'] = 5200
pages_nginx['listen_https'] = false
pages_nginx['http2_enabled'] = false
pages_nginx['proxy_set_headers'] = { "Host" => "$$http_host", "X-Real-IP" => "$$remote_addr", "X-Forwarded-For" => "$$proxy_add_x_forwarded_for", "X-Forwarded-Proto" => "https", "X-Forwarded-Ssl" => "on" }

gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = ENV['SMTP_ADDRESS']
gitlab_rails['smtp_port'] = ENV['SMTP_PORT']
gitlab_rails['smtp_user_name'] = ENV['SMTP_USER_NAME']
gitlab_rails['smtp_password'] = File.read('/run/secrets/gitlab_smtp_password').strip
gitlab_rails['smtp_domain'] = ENV['SMTP_DOMAIN']
gitlab_rails['smtp_authentication'] = ENV['SMTP_AUTHENTICATION']
gitlab_rails['smtp_enable_starttls_auto'] = ENV['SMTP_ENABLE_STARTTLS_AUTO']
gitlab_rails['smtp_tls'] = ENV['SMTP_TLS']
gitlab_rails['smtp_ssl'] = ENV['SMTP_SSL']
gitlab_rails['smtp_openssl_verify_mode'] = ENV['SMTP_OPENSSL_VERIFY_MODE']
gitlab_rails['gitlab_email_from'] = ENV['GITLAB_EMAIL']
gitlab_rails['gitlab_email_reply_to'] = ENV['GITLAB_EMAIL_REPLY_TO'] || ENV['GITLAB_EMAIL']

gitlab_rails['backup_path'] = ( ENV['GITLAB_BAKUPS'] || '/backups' ) + '/gitlab'

gitlab_rails['backup_keep_time'] = 604800

gitlab_pages['inplace_chroot'] = true
gitlab_pages['external_http'] = ['gitlab:5201']