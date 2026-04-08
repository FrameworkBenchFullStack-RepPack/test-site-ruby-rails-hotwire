Rails.application.config.after_initialize do
  unless Rails.cache.exist?("live_stream_started")
    LiveStreamJob.perform_later
    Rails.cache.write("live_stream_started", true)
  end
end
