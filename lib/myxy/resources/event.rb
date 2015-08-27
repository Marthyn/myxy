module Myxy
  class Event
    include Myxy::Resource

    def other_attributes
      [
        :calendar_ids, :start, :end, :start_timezone, :end_timezone,
        :all_day, :title, :description, :color, :icon, :logo, :source_url,
        :time_buffer, :start_location, :end_location, :related_event_id,
        :trip, :length, :is_suggestion, :due, :rsvp_status
      ]
    end

    def mandatory_attributes
      [:event_type]
    end
  end
end
