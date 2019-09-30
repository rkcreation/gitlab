external_url "https://" + ENV['DOMAIN']
registry_external_url "https://" + ( ENV.has_key?('DOMAIN_REGISTRY') ? ENV['DOMAIN_REGISTRY'] : ( 'registry.' + ENV['DOMAIN'] ) )

print File.read('/run/secrets/gitlab_root_password').strip
print File.read('/run/secrets/gitlab_smtp_password').strip

gitlab_rails['initial_root_password'] = File.read('/run/secrets/gitlab_root_password').strip
gitlab_rails['lfs_enabled'] = true
gitlab_rails['gitlab_shell_ssh_port'] = ENV.has_key?('GITLAB_SSH_PORT') ? ENV['GITLAB_SSH_PORT'] : 9022

letsencrypt['enable'] = false

nginx['listen_port'] = 80
nginx['listen_https'] = false
nginx['proxy_set_headers'] = {  "X-Forwarded-Proto" => "https", "X-Forwarded-Ssl" => "on" }
registry_nginx['listen_port'] = 80
registry_nginx['listen_https'] = false
registry_nginx['proxy_set_headers'] = {  "X-Forwarded-Proto" => "https", "X-Forwarded-Ssl" => "on" }

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

gitlab_rails['backup_keep_time'] = 604800