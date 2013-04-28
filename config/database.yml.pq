
development:
  adapter: postgresql
#  encoding: unicode
  database: chsdesk_development
  pool: 5
  username: ckjain
  password: ckjain123
#  template: template0

test:
  adapter: postgresql
#  encoding: unicode
  database: chsdesk_test
  pool: 5
  username: ckjain
  password: ckjain123
#  template: template0

production:
  adapter: postgresql
  encoding: unicode
  database: db/chsdesk_production
  pool: 5
  username: ckjain
  password: ckjain123
  template: template0
