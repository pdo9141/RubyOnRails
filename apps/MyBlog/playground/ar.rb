require 'rubygems'
require 'active_record'

class Event < ActiveRecord::Base
    # belongs_to :location
    # has_many :reservations
    # has_many :attendees, :through => :reservations
    # has_and_belongs_to_many :attendees
end

class Attendee < ActiveRecord::Base
    # has_many :reservations
    # has_many :events, :through => :reservations
    # has_and_belongs_to_many :events

    # validates :firstname, :lastname, :format => {:with => /\A[A-Za-z]+\z/, :message => "Only a-z allowed"}
    # validates :firstname, :lastname, :length => { :minimum => 2, :maximum => 20, :too_short => "Too short man", :too_long => "Too long bro"}    
    # validates :email, :confirmation => true
end

# class Person < ActiveRecord::Base
#     self.primary_key = 'attid'
#     self.table_name = 'Attendees'
# end

class Reservation < ActiveRecord::Base
    # belongs_to :attendee
    # belongs_to :event
    # validates :agrees_to_terms, :acceptance => true
end

class Location < ActiveRecord::Base
    # has_many :events
    # validates :address, :uniqueness => true
    # validates :address, :format => { :with => /\A[0-9]+\z/ }, :allow_blank => true
    # validates :street, :length => { :minimum => 4 }, :allow_nil => true
end

ActiveRecord::Base.establish_connection(:adapter => 'sqlserver',
                                        :database => 'ActiveRecordDemo',
                                        :dataserver => 'WayTooGonzo',
                                        :username => 'sa',
                                        :password => '78799141')

    ######### Creating records
    # att1 = Attendee.new
    # att1.firstname = 'George'
    # att1.lastname = 'Washington'
    # att1.save

    # event1 = Event.create(:title => 'Fancy Dinner', :eventdate => '2013-08-27', :location_id => 2)

    ######### Retrieve records
    # event = Event.first()
    # event = Event.last()
    # events = Event.find_by_title('Fancy Dinner')
    # events = Event.find_by_title_and_eventdate('Fancy Dinner', '2013-08-27')
    # events = Event.where(:title => 'Fancy Dinner', :eventdate => '2013-08-27')
    # events = Event.where("title => 'Fancy Dinner' and eventdate => '2013-08-27'")

    events = Event.all()
    events.each do |e|
        puts e.title
    end

    ######### Update records
    # You can modify fields and call save after you retrieve object
    # event1.update(:date => '2013-12-25')

    ######### Delete records
    # event1.destroy

    ######### Relationships
    # To use has_and_belongs_to_many, we need to rename reservations table to attendees_events
    # Event.all().each do |e|
    #     puts e.location.name
    # end

    # Location.all().each do |l|
    #     l.events.each do |e|
    #         puts e.attendees[0].firstname
    #     end
    # end

    ######### Tests
    # smith_family = Attendee.where(:lastname => 'Smith')
    # event = Event.find_by_title('Fancy Dinner')
    # event.attendees.push smith_family
    # event.save

    # att = Attendee.create!(:firstname => 'D0ug', :lastname => 'Sm1th')
    # att = Attendee.create(:firstname => 'D0ug', :lastname => 'Sm1th')
    # if att.valid? == false
    #     att.errors.each do |e|
    #         puts "#{e} #{att.errors[e]}"
    #     end
    end

ActiveRecord::Base.connection.close                                        