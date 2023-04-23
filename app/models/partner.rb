class Partner < ApplicationRecord
  def consumer
    kafka = Kafka.new("broker.fxce-kafka-dev.vncdevs.com:31091")
    consumer = kafka.consumer(group_id: 'fxce-huan-nguyen')
    consumer.subscribe('fxce-huan-nguyen')
    consumer.each_message do |message|
      puts "####### #{message.value}"
    end
  end

  def producer
    kafka = Kafka.new("localhost:9092")
    1000.times do |item|
      sleep 1
      kafka.deliver_message("Test Produce Message #{SecureRandom.hex}", topic: 'fxce-huan-nguyen')
    end
  end

  def producer_locahost
    kafka = Kafka.new("localhost:9092")
    1000.times do |item|
      sleep 1
      kafka.deliver_message("Test Produce Message #{SecureRandom.hex}", topic: 'telecom_italia_grid_dd')
    end
  end

  def consumer_localhost
    kafka = Kafka.new("localhost:9092")
    consumer = kafka.consumer(group_id: 'telecom_italia_grid_dd')
    consumer.subscribe('telecom_italia_grid_dd')
    consumer.each_message do |message|
      puts "###### #{message.value}"
    end
  end

end

# rails runner Kafka.new.producer
# rails runner Kafka.new.consumer