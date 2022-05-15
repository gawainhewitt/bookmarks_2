require './database_connection_setup'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('bookmark_manager_test')
else
  DatabaseConnection.setup('bookmark_manager')
end