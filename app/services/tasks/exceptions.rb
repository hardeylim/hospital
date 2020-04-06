module Tasks::Exceptions

  class InvalidRoleError < StandardError
    def initialize
      super("You are not allowed to update this record")
    end
  end

  class InvalidParameterError < StandardError
    def initialize
      super("Invalid Parameter")
    end
  end

end