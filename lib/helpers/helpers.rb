module ApplicationHelper

  # def reliability_data_for service, colour, data
  #   service_data = data.select { |entry| entry['service'] == service }
  #   reliability = service_data.inject(0) { |memo, obj| memo += obj['reliability'] } / service_data.length if !service_data.empty?
  #   { service: service, reliability: reliability, color: colour }.to_json
  # end

  # def save_latencies_to_db latencies
  #   latencies.each do |service, latency|
  #     $js_latencies_coll.insert( { service: service, time: Time.now, latency: latency } )
  #   end
  # end

  # def last_day_data collection
  #   settings.mongo_db['realtime_benchmarks']["#{collection}"].find({ time: { "$gt" => Time.now - 24*60*60 } }, sort: ["time", 1]).to_a
  # end
end