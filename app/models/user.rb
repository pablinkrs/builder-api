class User
  include Mongoid::Document
  belongs_to :perfil

  # belongs_to :padre ,:class_name=> :User, :foreign_key=>"padre_id"
  # has_many :hijos ,:class_name=> :User, :foreign_key=>"padre_id", :dependent => :delete_all

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String
  field :activado, type: Boolean, default: true
  field :padre_id, type: String
  field :perfil_id, type: String
  field :datos, type: Hash
  field :password_provisoria, type: Boolean

  ## Token Authenticatable
  acts_as_token_authenticatable
  field :authentication_token #, default: SecureRandom.uuid.gsub(/\-/,'')

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
end
# perfild id 57d163a9cf0dc24ec527c2c6
# 57d1b9d8cf0dc2548f27c2c6
