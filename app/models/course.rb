class Course < ActiveRecord::Base

    belongs_to :professor

    has_many :enrolls, :dependent => :destroy
    has_many :students, :through => :enrolls, :source => :user

end
