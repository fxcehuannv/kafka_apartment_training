class Bitcoin < ApplicationRecord
  def run_update
    update_bitcoin_thread_with_locking
    update_bitcoin_thread
  end

  private

  def update_bitcoin_thread_with_locking
    Bitcoin.find_by(name: 'Bitcoin').update(count: 0)
    sleep 5
    threads = []
    5.times do
      threads << Thread.new do
        Bitcoin.transaction do
          bitcoin = Bitcoin.find_by(name: 'Bitcoin')
          bitcoin.lock!
          bitcoin.count += 1
          bitcoin.save!
        end
      end
    end
    threads.each(&:join)
    puts "################ Bitcoin (#{Bitcoin.last.count}) #{Bitcoin.last.count == 5} ###################"
  end

  def update_bitcoin_thread
    Bitcoin.find_by(name: 'Bitcoin').update(count: 0)
    sleep 5
    threads = []
    1000.times do
      threads << Thread.new do
        bitcoin = Bitcoin.find_by(name: 'Bitcoin')
        bitcoin.count += 1
        bitcoin.save!
      end
    end
    threads.each(&:join)
    puts "################ Bitcoin #{Bitcoin.last.count == 1} ###################"
  end
end
