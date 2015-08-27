module Myxy
  class Calendar
    include Myxy::Resource

    def other_attributes
      [
        :id, :created, :service_id, :name, :description, :category,
        :color, :image, :sync_token, :url, :calendar_type, :first_import,
        :import_failed, :permission, :previous_permission
      ]
    end

    def mandatory_attributes
      []
    end

    def save
      false && Log.error('This resource cannot be created and or updated')
    end

    def delete
      false && Log.error('This resource cannot be deleted')
    end
  end
end
