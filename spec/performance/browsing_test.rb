require 'test_helper'
require 'rails/performance_test_help'

class BrowsingTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { :runs => 5, :metrics => [:wall_time, :memory]
  #                          :output => 'tmp/performance', :formats => [:flat] }

  def test_homepage
    get '/'
  end

  def test_aboutpage
    get '/about'
  end

   def test_loginpage
    get '/login'
  end

  def test_loginpage
    get '/statuses'
  end

   def test_registerpage
    get '/register'
  end

   def test_signoutpage
    get '/'
  end




end
