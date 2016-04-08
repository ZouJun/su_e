conf = YAML.load(File.open("#{Rails.root}/config/config.yml"))
env_conf = conf[Rails.env]

# 超级管理员
$admin_users = env_conf['admin']

# 每个配置生成设置项
$config = env_conf