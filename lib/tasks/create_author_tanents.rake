namespace :create_author_tanents do
  desc 'migrate_partners'
  task start: :environment do
    threads = []
    # Apartment::Tenant.each do |tanent|
    #   threads << Thread.new(tanent) do |tanent|
    #     Apartment::Tenant.switch(tanent) do
    #       time_now = Time.now
    #       100000.times do |item|
    #         ActiveRecord::Base.connection.execute <<~SQL
    #           INSERT INTO "#{tanent}".authors (name, created_at, updated_at)
    #           VALUES ('Name', '#{time_now}', '#{time_now}');
    #         SQL
    #       end
    #     end
    #   end
    # end

    Apartment::Tenant.each do |tanent|
      threads << Thread.new {
        5.times do |item|
          puts "adding #{item}"
          ActiveRecord::Base.connection.execute <<~SQL
            INSERT INTO "#{tanent}".authors (name, created_at, updated_at)
            VALUES ('222222222222', '#{Time.now}', '#{Time.now}');
          SQL
        end
      }
    end

    threads.each(&:join)
  end
end
