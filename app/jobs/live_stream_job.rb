class LiveStreamJob < ActiveJob::Base
  queue_as :default

  DATA = [
        [ 48, 32, 75 ],
        [ 53, 38, 69 ],
        [ 59, 44, 62 ],
        [ 65, 49, 56 ],
        [ 70, 55, 50 ],
        [ 75, 61, 44 ],
        [ 80, 66, 38 ],
        [ 85, 71, 33 ],
        [ 88, 75, 27 ],
        [ 91, 78, 22 ],
        [ 92, 80, 20 ],
        [ 90, 77, 25 ],
        [ 86, 73, 30 ],
        [ 83, 68, 35 ],
        [ 78, 63, 41 ],
        [ 73, 58, 47 ],
        [ 67, 52, 53 ],
        [ 62, 47, 59 ],
        [ 56, 41, 65 ],
        [ 51, 35, 72 ]
        ]

  def perform(index = 0)
    value = DATA[index]

    Turbo::StreamsChannel.broadcast_replace_to(
      "live_data",
      target: "live-data-row",
      partial: "shared/live/live_row",
      locals: {
        value1: value[0],
        value2: value[1],
        value3: value[2]
      }
    )

    next_index = (index + 1) % DATA.size
    self.class.set(wait: 1.second).perform_later(next_index)
  end
end
