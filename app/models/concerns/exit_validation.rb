module ExitValidation
  extend ActiveSupport::Concern
  included do
    before_create :exit_destroy
  end
  def exit_destroy
      
  end

end