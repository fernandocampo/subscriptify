class Email
  include ActiveModel::Model

  attr_accessor :to, :subject, :body

  validates :to, :subject, :body, presence: true

  def initialize(params = {})
    @to = params[:to]
    @subject = params[:subject]
    @body = params[:body]
  end
end
