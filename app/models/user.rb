class User < ActiveRecord::Base
  # class << self
  #   def current_user=(user)
  #     Thread.current[:current_user] = user
  #   end

  #   def current_user
  #     Thread.current[:current_user]
  #   end
  # end
  
  #after_create :set

  ROLES = %w[admin seo manager none]

  has_many :sites, :dependent => :nullify

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :name
  accepts_nested_attributes_for :sites
  # attr_accessible :title, :body

  #def role_enum
  #  %w[admin seo manager]
  #end

  def role?(role)
    self.role == role.to_s
  end

  def object_label_method 
    "User #{self.email}"
  end

  def name
    email
  end

end