class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :table_config_users
  has_many :table_configs, through: :table_config_users
  has_many :table_users
  has_many :tables, through: :table_users
  has_many :game_users
  has_many :games, through: :game_users
  has_many :friend_requests, :dependent => :destroy
  has_many :friendships, :dependent => :destroy
  has_many :friends, through: :friendships

  has_attached_file :image,
    Poker::Configuration.paperclip_options[:users][:image]

  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }

  before_create :set_joining_bonus
  before_validation :set_fb_login_details, :set_guest_login_details

  def avatar
    self.image? ? image.url(:avatar) : nil
  end

  def folds_percent
    (folds * 100)/total_turns rescue 0
  end

  def raises_percent
    (raises * 100)/total_turns rescue 0
  end

  def checks_percent
    (checks * 100)/total_turns rescue 0
  end

  def bets_percent
    (bets * 100)/total_turns rescue 0
  end

  def all_ins_percent
    (all_ins * 100)/total_turns rescue 0
  end

  def player_since
    created_at.strftime("%B,%Y")
  end

  def full_name
    [first_name, last_name].join(" ")
  end

  def preferred_table_config
    table_config_users.where(active: true).first
  end

  def preferred_table_config_id
  	preferred_table_config.try(:table_config_id)
  end

  def get_table
    tables = Table.where(table_config_id: @user.preferred_table_config_id)
  end

  private

  def set_joining_bonus
    self.chips = 10000
  end

  def set_fb_login_details
    if fb_id
      password_generated = SecureRandom.hex(4)
      self.password = password_generated
      self.password_confirmation = password_generated
    end
  end

  def set_guest_login_details
    if is_guest
      password_generated = SecureRandom.hex(4)
      self.email = "guest_"+SecureRandom.hex(3)+"@pokerapi.com"
      self.password = password_generated
      self.password_confirmation = password_generated
    end
  end

end