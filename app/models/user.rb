class User < ActiveRecord::Base
    has_many :destinations
    has_many :comments
    has_many :trips
    has_many :destinations, through: :trips
    has_many :tours, through: :comments
    has_secure_password
    validates :name, :username, length: { minimum: 2, message: "Must be at least 2 characters." } 
    validates :name, :username, :budget, :vacation_time, presence: true
    validates :username, uniqueness: true
    validate :minimum_numerical
    
    def minimum_numerical
        if self.budget < 0 
            errors.add(:budget, "Please enter a proper budget amount.")
        elsif self.vacation_time < 0
            errors.add(:vacation_time, "Please enter how many vacation days you are alotted.")
        end
    end

    def self.from_omniauth(auth)
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = "password123"
        end
        session[:user_id] = @user.id
        render 'sessions/home'
    end

end


    # before_save { self.email = email.downcase }
    # has_many :tours, dependent: :destroy
    # validates :username, presence: true, uniqueness: { case_sensitive: false}, length: {minimum: 3, maximun: 25}
    
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # validates :email, presence: true, uniqueness: { case_sensitive: false}, length: {minimum: 1, maximun: 105}, format: { with: VALID_EMAIL_REGEX }
    # has_secure_password

