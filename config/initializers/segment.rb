if ENV['SEGMENT_WRITE_KEY']
  Analytics = Segment::Analytics.new({
    write_key: ENV['SEGMENT_WRITE_KEY']
  })
end
