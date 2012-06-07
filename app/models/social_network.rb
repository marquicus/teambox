# == Schema Information
#
# Table name: social_networks
#
#  id                   :integer(4)      not null, primary key
#  card_id              :integer(4)
#  name                 :string(255)
#  account_network_type :integer(4)      default(0)
#  account_type         :integer(4)      default(0)
#

class SocialNetwork < ActiveRecord::Base
  belongs_to :user
  NETWORK_TYPES = ['Twitter','Facebook','Linked In','FriendFeed','MySpace','Delicious','Stumble Upon','Google+','Youtube','Google Code','Github','Other']
  TYPES = ['Personal','Business','Other']

  def get_network_type
    NETWORK_TYPES[account_network_type]
  end
  
  def get_type
    TYPES[account_type]
  end
  
  def to_url
    if name.include? ".com/"
      name
    else
      case get_network_type
        when 'Twitter'      then "https://twitter.com/#{name}"
        when 'Facebook'     then "https://www.facebook.com/#{name}"
        when 'Linked In'    then "https://www.linkedin.com/in/#{name}"
        when 'FriendFeed'   then "https://friendfeed.com/#{name}"
        when 'MySpace'      then "https://www.myspace.com/#{name}"
        when 'Delicious'    then "http://www.delicious.com/#{name}"
        when 'Stumble Upon' then "http://#{name}.stumbleupon.com/"
        when 'Google+'      then "http://www.google.com/profiles/#{name}"
        when 'Youtube'      then "http://www.youtube.com/user/#{name}"
        when 'Google Code'  then "http://code.google.com/u/#{name}"
        when 'Github'       then "https://github.com/#{name}"
      end
    end
  end
end