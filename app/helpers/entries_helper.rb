module EntriesHelper
  def publish
	  data = {:from => "4", :to => "5", :sms =>""}
      $redis.publish :happy, data.to_json
  end
end
