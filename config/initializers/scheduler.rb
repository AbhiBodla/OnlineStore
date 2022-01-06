


require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron '0 0 * * *' do

   ProductVariant.where( "expiry <= ?", Date.today).destroy_all

end
