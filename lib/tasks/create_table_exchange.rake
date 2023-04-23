namespace :create_table_exchange do
  desc 'create_table_exchange'
  task start: :environment do
    Apartment::Tenant.each do |tenant|
      sql = <<~SQL
        CREATE TABLE "#{tenant}".bitcoin_exchanges (
          id int,
          from_address varchar(255),
          to_address varchar(255)
        );
      SQL
      ActiveRecord::Base.connection.execute(sql)
    end
  end
end


# ActiveRecord::Base.connection.execute("select * from partners").values