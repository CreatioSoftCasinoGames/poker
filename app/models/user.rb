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

  has_attached_file :image,
    Poker::Configuration.paperclip_options[:users][:image]

  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }

  before_create :set_joining_bonus

  def avatar
    self.image? ? image.url(:avatar) : nil
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

end