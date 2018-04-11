module Order::Contract
  class Create < Reform::Form
    #:property
    property :start_point
    property :end_point
    property :client_name
    property :client_phone
    #:property end

    validates :start_point, :end_point, :client_name, presence: true
    validates :client_phone, presence: true, length: { is: 9 }

    def client_phone=(value)
      super(value.gsub(/[^\d]/, ''))
    end
  end
end
